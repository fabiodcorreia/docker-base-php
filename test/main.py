import sys
import os
import mechanize

APP_TEST_PORT = "80"

assert len(sys.argv) > 1, "no arguments"

APP_TEST_URL = sys.argv[1]

print("TEST_ULR=" + APP_TEST_URL)

br = mechanize.Browser()
br.set_handle_robots(False)

response = br.open(APP_TEST_URL)
assert response.code == 200, "response code is not 200"
assert br.title() == "PHP 7.3.21 - phpinfo()", "found: " + br.title()
