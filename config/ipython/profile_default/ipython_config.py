from pathlib import Path

c.HistoryManager.hist_file = str(
    Path(__file__).parents[3] / ".state" / "ipython" / "history.sqlite"
)
