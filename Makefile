install-torch-dev:
	pip install -U pip
	pip install -e .[torch]
	pip install -r tests/torch/requirements.txt
	pip install -r examples/torch/requirements.txt

	# Install pylint
	pip install pylint==2.13.9

install-tf-dev:
	pip install -U pip
	pip install -e .[tf]
	pip install -r tests/tensorflow/requirements.txt
	pip install -r examples/tennsorflow/requirements.txt

	# Install pylint
	pip install pylint==2.13.9

install-onnx-dev:
	pip install -U pip
	pip install -e .[onnx]
	pip install -r tests/onnx/requirements.txt
	pip install -r examples/experimental/onnx/requirements.txt

	# Install pylint
	pip install pylint==2.13.9

test-common:
	pytest tests/common --junitxml nncf-tests.xml

test-torch:
	pytest tests/torch --junitxml nncf-tests.xml

test-tf:
	pytest tests/tensorflow --junitxml nncf-tests.xml

test-onnx:
	pytest tests/onnx --junitxml nncf-tests.xml

pylint-common:
	pylint --rcfile .pylintrc	\
		nncf/common				\
		nncf/config				\
		nncf/api				\
		tests/common

pylint-torch:
	pylint --rcfile .pylintrc	\
		nncf/torch				\
		tests/torch				\
		examples/torch

pylint-tf:
	pylint --rcfile .pylintrc	\
		nncf/tensorflow			\
		tests/tensorflow		\
		examples/tensorflow

pylint-onnx:
	pylint --rcfile .pylintrc		\
		nncf/experimental/onnx		\
		tests/onnx					\
		examples/experimental/onnx
