python -m tensorflow_datasets.scripts.download_and_prepare \
   --datasets=c4/en.realnewslike \
   --data_dir=gs://db-cm-dev/yliu/tensorflow_datasets \
   --beam_pipeline_options="runner=DataflowRunner, project=db-cm-dev, region=us-central1,job_name=c4gen, staging_location=gs://db-cm-dev/binaries,temp_location=gs://db-cm-dev/temp, requirements_file=requirements.txt,max_num_workers=500"
