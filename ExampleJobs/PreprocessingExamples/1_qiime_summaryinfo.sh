#!/bin/bash

#SBATCH --account=<accountspec>
#SBATCH --partition=<partitionspec>
#SBATCH --job-name=qiime_summaryinfo
#SBATCH --output=qiime_summaryinfo.out
#SBATCH --error=qiime_summaryinfo.err
#SBATCH --time=00:00:00
#SBATCH --mem=<number>G
#SBATCH --ntasks-per-node=<number>
#SBATCH --cpus-per-task=<number>
#SBATCH --mail-user=apulvino@u.northwestern.edu
#SBATCH --mail-type=END

module load qiime2/2022.8

qiime tools import --input-path /path/to/your/<ManifestFile>.csv \
--output-path /path/to/your/output/<AppropriatelyNamed>.qza --type SampleData[PairedEndSequencesWithQuality] \
--input-format PairedEndFastqManifestPhred33

## summarizing manifest file
##output qza from above should be passed to --i-data
qiime demux summarize --i-data /path/to/your/output/<AppropriatelyNamed>.qza \
--o-visualization /path/to/your/output/visualization/<AppropriatelyNamed>.qzv

## the next step is dada2; you'll have to manually decide cutoff values there. See the dada2 .sh files for more details
