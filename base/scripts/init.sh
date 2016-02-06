set -e

sh $METEORD_DIR/lib/install_base.sh
sh $METEORD_DIR/lib/install_node.sh
sh $METEORD_DIR/lib/install_phantomjs.sh
sh $METEORD_DIR/lib/cleanup.sh
