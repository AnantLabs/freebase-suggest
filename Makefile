SRC_DIR = src
CSS_DIR = ${SRC_DIR}/css

PREFIX = .
COPYRIGHT = ${PREFIX}/COPYRIGHT
DIST_DIR = ${PREFIX}/dist
EXAMPLES = ${PREFIX}/examples

ALL_FILES = ${SRC_DIR}/core.js\
	${SRC_DIR}/suggest.js\
	${SRC_DIR}/select.js
	
SUGGEST_FILES = ${SRC_DIR}/core.js\
	${SRC_DIR}/suggest.js

SELECT_FILES = ${SRC_DIR}/core.js\
	${SRC_DIR}/select.js	

CONTROLS = ${DIST_DIR}/freebase.controls.js
SUGGEST = ${DIST_DIR}/freebase.suggest.js
SELECT = ${DIST_DIR}/freebase.select.js

FB_VER = `cat VERSION`
VER = sed s/@VERSION/${FB_VER}/

all: controls suggest select
	@@echo "all build complete."

${DIST_DIR}:
	@@mkdir -p ${DIST_DIR}
	
	@@echo "Copying" ${EXAMPLES}

	@@cp -r ${EXAMPLES}/* ${DIST_DIR}

	@@echo ${EXAMPLES} "Copied"
	@@echo

controls: ${CONTROLS}

${CONTROLS}: ${DIST_DIR}
	@@echo "Building" ${CONTROLS}
	
	@@cat ${COPYRIGHT} ${ALL_FILES} | ${VER} > ${CONTROLS}
	
	@@echo ${CONTROLS} "Built"
	@@echo

suggest: ${SUGGEST}

${SUGGEST}: ${DIST_DIR}
	@@echo "Building" ${SUGGEST}
	
	@@cat ${COPYRIGHT} ${SUGGEST_FILES} | ${VER} > ${SUGGEST}
	
	@@echo ${SUGGEST} "Built"
	@@echo
	

select: ${SELECT}

${SELECT}: ${DIST_DIR}
	@@echo "Building" ${SELECT}
	
	@@cat ${COPYRIGHT} ${SELECT_FILES} | ${VER} > ${SELECT}
	
	@@echo ${SELECT} "Built"
	@@echo

clean:
	@@echo "Removing Distribution directory:" ${DIST_DIR}
	@@rm -rf ${DIST_DIR}
