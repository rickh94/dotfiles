# Defined in /tmp/fish.B390kR/twine_upload_testing.fish @ line 1
function twine_upload_testing
	rm -rf dist/*
	pipenv run python setup.py sdist bdist_wheel
env TWINE_PASSWORD=(pass show pypi/testing) twine upload -r test -s dist/*
end
