# If you are running on Dataflow, Spark,..., you may have to set-up runtime
# flags. Otherwise, you can leave flags empty [].
flags = ['--runner=DataflowRunner', '--project=db-cm-dev', 'region=us-central1', 'job_name=c4gen', 'staging_location=gs://db-cm-dev/binaries', 'temp_location=gs://db-cm-dev/temp', 'requirements_file=/tmp/beam_requirements.txt', 'max_num_works=500']

# To use Beam, you have to set at least one of `beam_options` or `beam_runner`
dl_config = tfds.download.DownloadConfig(
    beam_options=beam.options.pipeline_options.PipelineOptions(flags=flags)
)

data_dir = 'gs://db-cm-dev/yliu/tensorflow_datasets'
builder = tfds.builder('c4/en.realnewslike', data_dir=data_dir)
builder.download_and_prepare(
    download_dir=FLAGS.download_dir,
    download_config=dl_config,
)
