import sys, math

class lj_potential:
    keyword = ''
    lj_function = ''
    epsilon = 0.0
    sigma = 0.0
    comment = ''
    primitive_type = True  # whether this potential has been set explicity or is a "cloned" potential
    clone_primitive_warned = False # whether the script has already printed that this potential is not to be cloned

    epsilons = []
    sigmas = []

    def __init__ (self, arg = None):
        keyword = ''
        lj_function = ''
        comment = ''
        epsilon = 0.0
        sigma = 0.0
        if (type (arg) == type (self)):
            (keyword, lj_function, epsilon, sigma, comment) = (arg.keyword, arg.lj_function, arg.epsilon, arg.sigma, arg.comment)
            self.primitive_type = False
        elif (type (arg) == tuple):
            (keyword, lj_function, epsilon, sigma, comment) = arg
            self.primitive_type = True

        # initialize from explicit parameters
        self.keyword = str (keyword)
        self.lj_function = str (lj_function)
        self.epsilon = float (epsilon)
        self.sigma   = float (sigma)
        self.comment = str (comment)

        self.epsilons = []
        self.sigmas = []


class lj_table (dict):
    
    # i/o functions

    def __init__ (self, file_name = None):
        if (file_name != None):
            self.parse (file_name)

    def parse (self, file_name):
        for line in (file (file_name, 'r')):
            if ((line[:1] == '!') or (line[:1] == '#')): continue
            words = line.split()
            if (len (words) == 0): continue
            if (words[0] != 'pair'):
                sys.stderr.write ("Error: found unsupported keyword \"%s\" in file.\n" % words[0])
                sys.exit (1)
            if (len (words) < 6): 
                sys.stderr.write ("Error: insufficient number of fields in line \"%s\"\n" % line)
                sys.exit (1)
            (keyword, type1, type2, lj_function, epsilon, sigma) = words[0:6]
            comment = ''
            if (line.find ('#') > 0):
                comment = line[line.find ('#')+1:-1]
            if (line.find ('!') > 0):
                comment = line[line.find ('!')+1:-1]

            if (self.has_key ((type1, type2))):
                sys.stderr.write ("Error: duplicate record for LJ pair (%4s, %4s): it exists already in the database.\n" % (type1, type2))
                sys.exit (1)

            self[(type1, type2)] = lj_potential ((keyword, lj_function, epsilon, sigma, comment))


    def format (self, pair):
        pot = self[pair]
        (type1, type2) = pair
        return ("%-8s  %-6s %-6s  %-6s  %9.4f %9.4f  #%s\n" % (pot.keyword, type1, type2,
                                                               pot.lj_function, pot.epsilon, pot.sigma, pot.comment))
    def __str__ (self):
        s = ""
        for pair in self.keys():
            s += (self.format (pair))
        return s

    # overloaded dictionary functions

    def has_key (self, pair):
        (type1, type2) = pair
        return (dict.has_key (self, (type1, type2)) or dict.has_key (self, (type2, type1)))

    def __getitem__ (self, pair):

        (type1, type2) = pair

        # if one of the keywords is empty, return a sub-dictionary
        if (type1 == ''):
            # assume that type2 is empty, or swap them instead
            (type1, type2) = (type2, '')
        if (type2 == ''):
            sub_dict = lj_table()
            for pair_b in dict.keys (self):
                (type1_b, type2_b) = pair_b
                if ((type1_b == type1) or (type2_b == type1)):
                    sub_dict[(type1_b, type2_b)] = dict.__getitem__ (self, (type1_b, type2_b))
            return sub_dict

        if (dict.has_key (self, (type1, type2))):
            return dict.__getitem__ (self, (type1, type2))
        elif (dict.has_key (self, (type2, type1))):
            return dict.__getitem__ (self, (type2, type1))
        else:
            return None

    def __setitem__ (self, pair, pot):
        (type1, type2) = pair
        if (self.has_key (pair)):
            if ((self[pair]).primitive_type):
                sys.stderr.write ("Error: trying to reassign parameters for LJ pair (%4s, %4s): it exists already in the database.\n" % (type1, type2))
                sys.exit (1)
        return dict.__setitem__ (self, pair, pot)


    def clone (self, types_old, type_new):

        extra_comment = ''
        if (type (types_old) == str):
            extra_comment = (" (%s -> %s)" % (types_old, type_new))
            types_old = [types_old]
        elif (type (types_old) == tuple):
            types_old = list (types_old)
            extra_comment = (" (%s -> %s)" % ((','.join (types_old)), type_new))

        for type_old in types_old:

            for pair in self.keys():
                (type1, type2) = pair

                if (type1 == type_old):
                    if (type2 == type_old):
                        self.add_clone ((type_new, type_new), self[pair], extra_comment)
                    else:
                        self.add_clone ((type_new, type2),    self[pair], extra_comment)
                elif (type2 == type_old):
                    self.add_clone ((type1, type_new), self[pair], extra_comment)

        for type_old in types_old:
            # add the (old - new) self-interaction
            self.add_clone ((type_old, type_new), self[(type_old, type_old)], extra_comment)
    
        self.reset_cloning_lists()


    def add_clone (self, pair, lj_pot, extra_comment = ''):

        # add parameters for "pair" using the potential "lj_pot" as guess 

        if (self.has_key (pair)):
            if (self[pair].primitive_type):
                (type1, type2) = pair
                if (not self[pair].clone_primitive_warned):
                    sys.stderr.write ("Info: explicit parameters for pair %4s-%4s, no need to guess.\n" % (type1, type2))
                    self[pair].clone_primitive_warned = True
                return
            if (self[pair].lj_function != lj_pot.lj_function):
                sys.stderr.write ("Error: trying to combine two different functional forms: %4s-%4s uses %s, trying to combine it with a %s.\n" % (type1, type2, self[pair].lj_function, lj_pot.lj_function))
        else:
            (self[pair]) = lj_potential (lj_pot)
        (self[pair]).comment += extra_comment

        # store them in a list so that we can take the geometric average
        ((self[pair]).epsilons).extend ([lj_pot.epsilon])
        ((self[pair]).sigmas).extend ([lj_pot.sigma])

        # recalculate average epsilon and average sigma if there are more than one for each
        epsilon = 1.0
        sigma = 1.0
        for (epsilon_2, sigma_2) in map (None, (self[pair]).epsilons, (self[pair]).sigmas):
            epsilon *= epsilon_2
            sigma   *= sigma_2
        (self[pair]).epsilon = math.pow (epsilon, float (1.0 / len ((self[pair]).epsilons)))
        (self[pair]).sigma   = math.pow (sigma,   float (1.0 / len ((self[pair]).sigmas)))


    def reset_cloning_lists (self):
        # after having looped over all base types for one of the types in the pair,
        # reset the lists to not interfere with redefinitions of the other type
        for lj_pot in self.values():
            lj_pot.epsilons[:] = []
            lj_pot.sigmas[:] = []


    def rescale_interactions (self,
                              types_old, type_new,
                              epsilon_ref = None,
                              sigma_ref = None,
                              epsilon_scale = 1.0,
                              sigma_scale = 1.0,
                              affected_types = None,
                              comment = ""):

        if (epsilon_scale == None):
            if (epsilon_ref):
                sys.stderr.write ("Error: can only rescale using either a reference type, or an explicit scaling factor for that type.\n")
            epsilon_scale = 1.0
        if (sigma_scale == None):
            if (sigma_ref):
                sys.stderr.write ("Error: can only rescale using either a reference type, or an explicit scaling factor for that type.\n")
            sigma_scale = 1.0
            
            
        old_epsilon = 1.0
        old_sigma = 1.0
        # if requested, use the ratio of the new vs old self-interactions as scale factor
        if ((epsilon_ref != None) or (sigma_ref != None)):
            if (type (types_old) == str):
                old_epsilon = self[types_old, types_old].epsilon
                old_sigma   = self[types_old, types_old].sigma
            elif (type (types_old) == tuple):
                types_old_l = list (types_old)
                old_epsilon_ave = 1.0
                old_sigma_ave = 1.0
                for (old_epsilon_i, old_sigma_i) in zip ([self[old_i, old_i].epsilon for old_i in types_old_l],
                                                         [self[old_i, old_i].sigma for old_i in types_old_l]):
                    old_epsilon *= old_epsilon_i
                    old_sigma   *= old_sigma_i
                old_epsilon = math.pow (old_epsilon, 1.0 / float (len (types_old_l)))
                old_sigma   = math.pow (old_sigma,   1.0 / float (len (types_old_l)))

        if (epsilon_ref != None):
            epsilon_scale = math.sqrt (self[epsilon_ref, epsilon_ref].epsilon / old_epsilon)
            if (comment != ""): comment += " "
            comment += ("(epsilon scaled using %4s-%4s)" % (epsilon_ref, epsilon_ref)) 

        if (sigma_ref != None):
            sigma_scale   = math.sqrt (self[sigma_ref, sigma_ref].sigma / old_sigma)
            if (comment != ""): comment += " "
            comment += ("(sigma scaled using %4s-%4s)" % (sigma_ref, sigma_ref))

        sys.stderr.write ("Info: type %4s cross-interactions scale factors for epsilon, sigma = %5.3f, %5.3f\n" % (type_new, epsilon_scale, sigma_scale))
        if (affected_types != None):
            sys.stderr.write ("Info: rescaling only interactions with types: "+(" ".join (affected_types))+"\n")

        if (math.fabs (epsilon_scale - 1.0) > 1.0e-06):
            self.rescale_epsilon (type_new, epsilon_scale, comment, affected_types)
        if (math.fabs (sigma_scale - 1.0) > 1.0e-06):
            self.rescale_sigma   (type_new, sigma_scale, comment, affected_types)

    def found_in_list (self, lj_type, type_list = None):
        if (type_list == None): return False
        if ((type (type_list) != list) and (type (type_list) != set)):
            sys.stderr.write ("Error: the list of types provided is not a list.\n")
            sys.exit (1)
        for other_type in type_list:
            if (lj_type == other_type):
                return True
        return False

    def rescale_epsilon (self, type_new, scale, comment = "", affected_types = None):
        if (affected_types == None):
            affected_types = self.types()
        for pair in self.keys():
            if (self[pair].primitive_type):
                continue
            (type1, type2) = pair
            if ( ((type1 == type_new) and self.found_in_list (type2, affected_types)) or
                 ((type2 == type_new) and self.found_in_list (type1, affected_types)) ):
                (self[pair]).epsilon *= scale
                if (comment != ""):
                    (self[pair]).comment += (" " + comment)
            if ((type1 == type_new) and (type2 == type_new)):
                (self[pair]).epsilon *= scale

    def rescale_sigma (self, type_new, scale, comment = "", affected_types = None):
        if (affected_types == None):
            affected_types = self.types()
        for pair in self.keys():
            if (self[pair].primitive_type):
                continue
            (type1, type2) = pair
            if ( ((type1 == type_new) and self.found_in_list (type2, affected_types)) or
                 ((type2 == type_new) and self.found_in_list (type1, affected_types)) ):
                (self[pair]).sigma *= scale
                if (comment != ""):
                    (self[pair]).comment += (" " + comment)
            if ((type1 == type_new) and (type2 == type_new)):
                (self[pair]).sigma *= scale


    def check_missing (self):
        for type1 in self.types():
            for type2 in self.types():
                if (not self.has_key((type1, type2))):
                    sys.stderr.write ("Warning: missing pair %4s-%4s.\n" % (type1, type2))
#                    sys.exit (1)

    def check_duplicates (self):
        for pair_a in self.keys():
            (type1a, type2a) = pair_a
            if (type1a == type2a): continue
            for pair_b in self.keys():
                (type1b, type2b) = pair_b
                if ((type1a == type2b) and (type2a == type1b)):
                    sys.stderr.write ("Error: duplicate pair %4s-%4s.\n" % (type1a, type2a))
                    # the inverse case is caught automatically by the dict base class
                    sys.exit (1)

    def types (self):
        retval = set()
        for pair in self.keys():
            (type1, type2) = pair
            retval.add (type1)
            retval.add (type2)
        return set (sorted (retval))
                
