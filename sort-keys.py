"""
Script used to sort keywords for the latex definition of \
various languages in lstlisting (see settings.sty).

All the keywords are TEMPORARILY stored in a file called "keywords"; \
another file can be specified as argument.
That same file will be overwritten with the sorted keywords.
"""

import sys


def main(file_name: str):
    """Script entry point."""
    with open(file_name) as f:
        data = f.read()

    keywords = data.split(",")
    sorted_keyword = sorted(set(k.strip() for k in keywords))

    with open(file_name, "w") as f:
        f.write(", ".join(sorted_keyword))


if __name__ == "__main__":
    if len(sys.argv) < 2:
        main("keywords")
    else:
        main(sys.argv[1])
