# Parameters for the SDK coarse-grained molecular dynamics potential

This repository contains force field parameters for the "SDK" potential [Shinoda2007], characterized by a coarse-grained (CG) representation of macromolecules [Shelley2001] and intermolecular forces derived from experimental data.

Several of the force fields here provided can be used in combination with one another.  For example, the water [Shinoda2007], phospholipid [Shinoda2010] and cholesterol [MacDermaid2015] force fields have already been used together [Shinoda2010, MacDermaid2015].  However, we encourage you to test any combination that is not already described in the publications cited.

If you have developed a force field based on the SDK potential, please consider uploading your parameters here.

## How to read or edit

The set of force fields is contained in the [JSON](https://en.wikipedia.org/wiki/JSON)-formatted files listed the top-level directory.  These can be accessed and used in many software packages and programming languages.

Each file contains dictionaries such as: `params` (set of force field parameters), `topo` (set of molecular topologies, including particle charges), or `types` (list of CG particle types).

For example, the following Python code displays the epsilon parameter of the Lennard-Jones potential between CT-type and CM-type particles:
```
import ffdb
ff_all_sdk = ffdb.load('par_all1_sdk.json')
ljpair = ffdb.find_params(ff_all_sdk, 'pair', atypes=('CT', 'CM'))
print("Epsilon(CT-CM) = ", ljpair['epsilon'])
bonds = ffdb.find_params(ff_all_sdk, 'bond', atypes=('*', 'N'))
for bond in bonds:
    print("K(", *(bond['types']), ") = ", bond['k'])
angles = ffdb.find_params(ff_all_sdk, 'angle', atypes=('*', '*', 'N'))
for angle in angles:
    print("K(", *(angle['types']), ") = ", angle['k'])
```
To modify the entry:
```
lj['sigma'] = <new value>
```
To write the modified parameters to a file:
```
ffdb.save('new_file.json')
```

## How to use in MD simulations

The database files provided here are used primarily by the [CG-it](https://github.com/CG-it/CG-it) plugin of [VMD](http://www.ks.uiuc.edu/Research/vmd/).  CG-it allows preparing model systems and/or converting atomistic snapshots or trajectories.

The reference implementation of this potential is provided by the [USER-CGSDK](http://lammps.sandia.gov/doc/Section_packages.html#user-cgsdk-package) package of the [LAMMPS](http://lammps.sandia.gov/) molecular dynamics program.

## How to identify which molecule templates are available

Conversion from atomistic topologies to CG topologies is done by CG-it, following templates for specific molecules.  Each template is defined based on residue names.  To see the list of templates defined, use:

```
import ffdb
top = ffdb.load('top_all1_sdk.json')
print(top['topo'].keys())
```

## Reference articles

The following papers describe parameters or topologies listed in the current database: other publications will be added as their contents are migrated here.

**[Shelley2001]**
J. C. Shelley, M. Y. Shelley, R. C. Reeder, S. Bandyopadhyay, and M. L. Klein.
J. Phys. Chem. B **105**, 4464 (2001).
http://dx.doi.org/10.1021/jp010238p
(initial version based on atomistic simulation data; now deprecated)

**[Shinoda2007]**
W. Shinoda, R. Devane, and M. L. Klein.
Multi-property fitting and parameterization of a coarse grained model for aqueous surfactants.
Mol. Simul. **33**, 27 (2007).
https://doi.org/10.1080/08927020601054050
(experiment-based parameterization method, water, linear alkanes, ethyleneglycols, linear alcohols)

**[Shinoda2010]**
W. Shinoda, R. DeVane, and M. L. Klein.
"Zwitterionic Lipid Assemblies: Molecular Dynamics Studies of Monolayers, Bilayers, and Vesicles Using a New Coarse Grain Force Field."
J. Phys. Chem. B **114**, 6836 (2010).
https://doi.org/10.1021/jp9107206
(zwitterionic phospholipids: PC and PE head groups)

**[MacDermaid2015]**
C. M. MacDermaid, H. K. Kashyap, R.H. DeVane, W. Shinoda, J. B. Klauda, M. L. Klein, and G. Fiorin.
Molecular dynamics simulations of cholesterol-rich membranes using a coarse-grained force field for cyclic alkanes.
J. Chem. Phys **143**, 243144 (2015)
https://doi.org/10.1063/1.4937153
(cholesterol, cyclic alkanes)

**[MacDermaid2020]**
C. M. MacDermaid, K. W. Hall, R. H. DeVane, M. L.Klein, G. Fiorin
Coexistence of Lipid Phases Stabilizes Interstitial Water in the Outer Layer of Mammalian Skin.
Biophys. J. **118**(7), 1588-1601 (2020)
https://doi.org/10.1016/j.bpj.2020.01.044
(free fatty acids, ceramides)
