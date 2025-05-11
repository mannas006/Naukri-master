import unittest
import naukria


class Test(unittest.TestCase):
    def test_naukri(self):
        (status, driver) = naukria.naukriLogin(headless=True)
        naukria.tearDown(driver)
        self.assertFalse(status)


if __name__ == "__main__":
    unittest.main()
