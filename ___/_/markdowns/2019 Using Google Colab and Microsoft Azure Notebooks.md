# Using Google Colab and Microsoft Azure Notebooks

## Overview

The services Google Colab and Microsoft Azure Notebooks offer similar functionality but there are differences.
This article describe the differences between both services and also how I use them for my work.

- <https://notebooks.azure.com>
- <https://colab.research.google.com/>

## Google Colab

### How to upload files

There are two ways how to uplaod files.

1. Use the sidebar and upload button.

2. use the upload file dialog inside the notebook cell.

    from google.colab import files
    uploaded_files = files.upload()

### How to list files

### How to download files

...

### How to ensure that you are using the GPU

    import tensorflow as tf

    device_name = tf.test.gpu_device_name()

    if device_name != '/device:GPU:0':
        raise SystemError('GPU device not found')

    print('Found GPU at: {}'.format(device_name))
