import os
import tensorflow as tf

export_dir = 'export_dir'
trained_checkpoint_prefix = '/m/wk/1/model_gia-young-picasso-v03-201216-var2_new_240000.ckpt-240000'

#/m/wk/1/model_gia-young-picasso-v03-201216-var2_new_240000.ckpt-240000.data-00000-of-00001
graph = tf.Graph()
loader = tf.train.import_meta_graph(trained_checkpoint_prefix + ".meta" )
sess = tf.Session()
loader.restore(sess,trained_checkpoint_prefix)
builder = tf.saved_model.builder.SavedModelBuilder(export_dir)
builder.add_meta_graph_and_variables(sess, [tf.saved_model.tag_constants.SERVING], strip_default_attrs=True)
builder.save()