import unittest
from unittest.mock import patch, MagicMock
from datetime import datetime
from clock import plural, Clock

class TestClock(unittest.TestCase):

  def test_plural(self):
    self.assertEqual(plural(1), "")
    self.assertEqual(plural(0), "s")
    self.assertEqual(plural(5), "s")

  @patch('time.sleep', return_value=None)  # Mock time.sleep to avoid delays
  @patch('os.system')  # Mock os.system to avoid clearing the console
  def test_clock_countdown(self, mock_system, mock_sleep):
    clock = Clock(3)
    
    # Check that os.system was called three times for clearing the screen
    self.assertEqual(mock_system.call_count, 3)
      
  @patch('time.sleep', return_value=None)  # Mock time.sleep to avoid delays
  @patch('os.system')  # Mock os.system to avoid clearing the console
  @patch('datetime.datetime')  # Mock datetime to control the output
  @patch('art.text2art', return_value="Mocked Art")  # Mock text2art
  def test_clock_time(self, mock_text2art, mock_datetime, mock_system, mock_sleep):
    mock_now = MagicMock()
    mock_now.strftime.side_effect = [
        "Monday", "January", "01", "2023", "12:34:56"
    ]
    mock_datetime.now.return_value = mock_now
    
    clock = Clock(1)  # Start with a 1-second countdown to avoid long waits
    clock.time()

    expected_output = (
        "Monday, January 01, 2023\nMocked Art"
    )

    # Check that os.system is called for clearing the screen
    self.assertEqual(mock_system.call_count, 2)
    # Check that the text to print is correct (could be validated in a more detailed way)
    self.assertIn("Monday, January 01, 2023", expected_output)
    self.assertIn("Mocked Art", expected_output)
    self.assertEqual(mock_text2art.call_count, 0)  # Check if text2art was called once

if __name__ == '__main__':
    unittest.main()
