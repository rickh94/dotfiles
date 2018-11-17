# Defined in /tmp/fish.vWpSaJ/twine_upload_live.fish @ line 2
function twine_upload_live
	rm -rf dist/*
pipenv run python setup.py sdist bdist_wheel
env TWINE_PASSWORD=(pass show pypi/live) twine upload -s dist/*
end
