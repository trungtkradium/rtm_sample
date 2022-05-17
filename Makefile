run-chrome-driver:
	chromedriver --port=4444

run-test:
	fvm flutter drive \
	  --driver=test_driver/integration_test.dart \
	  --target=integration_test/test.dart \
	  -d chrome --web-port=50500
