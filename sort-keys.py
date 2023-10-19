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

    keywords = data.replace("\n", ",").split(",")
    unique_keywords = set(k.strip() for k in keywords)
    sorted_keywords = sorted(unique_keywords, key=len)
    sorted_keywords = sorted(sorted_keywords, key=str.lower)

    with open(file_name, "w") as f:
        f.write(", ".join(sorted_keywords))


if __name__ == "__main__":
    if len(sys.argv) < 2:
        main("keywords")
    else:
        main(sys.argv[1])
