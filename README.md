# NANOPlasty - Long-read-organelle-assembly
NANOPlasty is a de novo assembler for short circular genomes with long sequencing reads (ONT/PacBio).

## Contents

- [Overview](#Overview)
- [Getting help](#Getting-help)
- [Installation guide](#Installation-guide)
- [How to run](#How-to-run)
- [Demo](#Demo)
- [Citation](#Citation)

  
## Getting help

Any issues/requests/problems/comments that are not yet addressed on this page can be posted on [Github issues](https://github.com/ndierckx/NANOPlasty/issues) and I will try to reply the same day.

Or you can contact me directly through the following email address:

nicolasdierckxsens at hotmail dot com 

If your assembly was unsuccessful, you could already add the log file and the configuration file to the mail, this could help me to identify the problem!

<a href="https://gbiomed.kuleuven.be/english/cme/research/laboratories/laboratory-for-cytogenetics-and-genome-research/laboratory-for-cytogenetics-and-genome-research" target="_blank"><img border="0" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/KU_Leuven_logo.svg/960px-KU_Leuven_logo.svg.png?_=20170712072519" width=auto height="70"></a><a href="https://www.oist.jp/research/research-units/grsu" target="_blank"><img border="0" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/OIST_logo.svg/960px-OIST_logo.svg.png?_=20230327070123" width=auto height="70"></a>

## Installation guide

## How to run

### 1. Create configuration file

You can download the example file (config.txt) and adjust the settings to your liking.  
Every parameter of the configuration file is explained below. 

### 2. Run NANOPlasty

<code>perl NANOPlasty0.2.pl -c config_nanoplasty.txt</code>

----------------------------------------------------------------------------------------------------------

## Configuration file

This is an example of a configuration file for the assembly of a chloroplast.
To make the assembler work, your configuration file has to have the exact same structure.
(Make sure there is always a space after the equals sign and every parameter is captured in one single line)

**1. Example of configuration file:**
<pre>

Project:
-----------------------
Project name          = Test
Type                  = chloro
Genome Range          = 110000-180000
Save assembled reads  = 
Seed Input            = 
Extend seed directly  = 
Threads               = 5
Chloroplast sequence  = 
Output path           = /path/to/output_folder/

Nanopore reads:
-----------------------
Nanopore reads        = 
Local DB and NP reads = 
R10                   = 
Min read length NP    = 

PacBio reads:
-----------------------
PacBio reads          = 
Local DB and PB reads = 
Min read length PB    = 

</pre>

**2. Explanation parameters:**
<pre>

Project:
-----------------------
Project name          = Choose a name for your project, it will be used for the output files.
Type                  = (chloro/mito/mito_plant) "chloro" for chloroplast assembly, "mito" for mitochondrial assembly and 
                        "mito_plant" for mitochondrial assembly in plants.
Genome Range          = (minimum genome size-maximum genome size) The expected genome size range of the genome.
                        Default value for mito: 12000-20000 / Default value for chloro: 120000-200000
                        If the expected size is know, you can lower the range, this can be useful when there is a repetitive
                        region, what could lead to a premature circularization of the genome.
Save assembled reads  = All the reads used for the assembly will be stored in seperate files (yes/no)
Seed Input            = The path to the file that contains the seed sequence (optional, there is a build in seed system).
Extend seed directly  = This gives the option to extend the seed directly, in stead of finding matching reads. Only use this when your seed 
                        originates from the same sample and there are no possible mismatches (yes/no)
Threads               = It is strongly adviced to use multiple cores for the assembly, give here the available cores
Output path           = /path/to/output_folder/

Nanopore reads:
-----------------------
Nanopore reads        = Only use this when you run the dataset for the first time. 
Local DB and NP reads = If you ran the dataset before, you can give the path of the previous output folder to reuse the database
R10                   = If you are using R10 data, please write "yes" here
Min read length NP    = Give the minimum read length to be used in the assembly, (default: 1000)

PacBio reads:
-----------------------
PacBio reads          = Only use this when you run the dataset for the first time. 
Local DB and NP reads = If you ran the dataset before, you can give the path of the previous output folder to reuse the database
Min read length PB    = Give the minimum read length to be used in the assembly, (default: 500)

</pre>
