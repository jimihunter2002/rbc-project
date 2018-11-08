#*** Settings ***

#*** Variables ***

from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.keys import Keys
from SeleniumLibrary.base import keyword


class MyLibrary():

    ROBOT_LIBRARY_SCOPE = 'TEST CASE'

    def __init__(self):
        pass

    @keyword("send key combo")
    def send_key_combo(self, key1, key2, locator):
        selib = BuiltIn().get_library_instance('SeleniumLibrary')
        if key1 == "shift" and key2 == "tab":
            element = selib.get_webelement(locator)
            element.send_keys(Keys.SHIFT, Keys.TAB)
        else:
            pass

