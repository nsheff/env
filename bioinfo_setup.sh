#awscli
pip install --user awscli

# bismark
gclo FelixKrueger/Bismark

# bowtie
gclo BenLangmead/bowtie
cd bowtie
make


java -Xmx16g -jar /cm/shared/apps/picard-tools/1.140/picard.jar SamToFastq I=/fhgfs/groups/lab_bock/shared/projects/epigenome_compendium/results_pipeline/K562_1/unmapped_bam/K562_1.bam F=/fhgfs/groups/lab_bock/shared/projects/epigenome_compendium/results_pipeline/K562_1/fastq/K562_1_R1.fastq F2=/fhgfs/groups/lab_bock/shared/projects/epigenome_compendium/results_pipeline/K562_1/fastq/K562_1_R2.fastq INCLUDE_NON_PF_READS=true QUIET=true VERBOSITY=ERROR


 time java -jar /cm/shared/apps/picard-tools/1.140/picard.jar SamToFastq I=/fhgfs/groups/lab_bock/shared/projects/epigenome_compendium/results_pipeline/K562_1/unmapped_bam/K562_1.bam F=/fhgfs/groups/lab_bock/shared/projects/epigenome_compendium/results_pipeline/K562_1/fastq/K562_1_R1.fastq F2=/fhgfs/groups/lab_bock/shared/projects/epigenome_compendium/results_pipeline/K562_1/fastq/K562_1_R2.fastq INCLUDE_NON_PF_READS=true QUIET=false VERBOSITY=ERROR
[Sat Jan 16 03:08:55 CET 2016] picard.sam.SamToFastq INPUT=/fhgfs/groups/lab_bock/shared/projects/epigenome_compendium/results_pipeline/K562_1/unmapped_bam/K562_1.bam FASTQ=/fhgfs/groups/lab_bock/shared/projects/epigenome_compendium/results_pipeline/K562_1/fastq/K562_1_R1.fastq SECOND_END_FASTQ=/fhgfs/groups/lab_bock/shared/projects/epigenome_compendium/results_pipeline/K562_1/fastq/K562_1_R2.fastq INCLUDE_NON_PF_READS=true VERBOSITY=ERROR QUIET=false    OUTPUT_PER_RG=false RG_TAG=PU RE_REVERSE=true INTERLEAVE=false READ1_TRIM=0 READ2_TRIM=0 INCLUDE_NON_PRIMARY_ALIGNMENTS=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Sat Jan 16 03:08:55 CET 2016] Executing as nsheffield@n002 on Linux 2.6.32-431.20.3.el6.x86_64 amd64; Java HotSpot(TM) 64-Bit Server VM 1.8.0_25-b17; Picard version: 1.140(a81bc82e781dae05c922d1dbcee737334612399f_1444244284) IntelDeflater
[Sat Jan 16 03:42:09 CET 2016] picard.sam.SamToFastq done. Elapsed time: 33.24 minutes.
Runtime.totalMemory()=20704657408
To get help, see http://broadinstitute.github.io/picard/index.html#GettingHelp
Exception in thread "main" htsjdk.samtools.SAMFormatException: SAM validation error: ERROR: Found 41630472 unpaired mates
	at htsjdk.samtools.SAMUtils.processValidationError(SAMUtils.java:451)
	at picard.sam.SamToFastq.doWork(SamToFastq.java:201)
	at picard.cmdline.CommandLineProgram.instanceMain(CommandLineProgram.java:206)
	at picard.cmdline.PicardCommandLine.instanceMain(PicardCommandLine.java:95)
	at picard.cmdline.PicardCommandLine.main(PicardCommandLine.java:105)

real	33m15.111s
user	122m34.197s
sys	3m49.098s
[nsheffield@n002 unmapped_bam]$ 

