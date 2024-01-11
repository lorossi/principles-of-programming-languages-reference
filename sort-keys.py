"""
Script used to sort keywords for the latex definition of \
various languages in lstlisting (see settings.sty).

All the keywords are TEMPORARILY stored in a file called "keywords"; \
another file can be specified as argument; the file gets overwritten.
"""

import sys


def main(file_name: str):
    """Script entry point."""
    try:
        with open(file_name) as f:
            data = f.read()
    except FileNotFoundError:
        print(f"File {file_name} not found.")
        return

    keywords = [k.strip() for k in data.replace("\n", ",").split(",") if k.strip()]
    sorted_keywords = sorted(set(keywords), key=lambda k: k.lower().replace("\\", ""))
    keywords_str = ", ".join(sorted_keywords)

    with open(file_name, "w") as f:
        f.write(keywords_str)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(
            "Sorting keywords in file 'keywords'. To specify another file, "
            "use 'python sort-keys.py <file_name>'"
        )
        main("keywords")
    else:
        main(sys.argv[1])
