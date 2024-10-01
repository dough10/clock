from art import text2art
from datetime import datetime
import time
import os

def plural(num:int) -> str:
  return "" if num == 1 else "s"
  
class Clock:
  def __init__(self, count:int):
    while count:
      self.clear()
      print(f'Starting {__file__}\n{count} second{plural(count)}')
      count -= 1
      time.sleep(1)

  def clear(self):
    os.system('cls' if os.name == 'nt' else 'clear')

  def time(self):
    now = datetime.now()
    date = f'{now.strftime("%A")}, {now.strftime("%B")} {now.strftime("%d")}, {now.strftime("%Y")}'
    text = f'{date}\n{text2art(now.strftime("%H:%M:%S"))}'
    self.clear()
    print(text)
    time.sleep(1)
    

if __name__ == "__main__":
  try:
    clock = Clock(5)
    while True:
      clock.time()
  except KeyboardInterrupt:
    clock.clear()