"""
Script used to sort keywords for the latex definition of \
various languages in lstlisting (see settings.sty).

All the keywords are TEMPORARILY stored in a file called "keywords"; \
another file can be specified as argument.
After sorting, the keywords are stored in a file called "sorted-keywords" \
(or "sorted-<file_name>" if another file is specified as argument).
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

    keywords = data.replace("\n", ",").split(",")
    unique_keywords = set(k.strip() for k in keywords)
    sorted_keywords = sorted(unique_keywords, key=len)
    sorted_keywords = sorted(sorted_keywords, key=str.lower)
    keywords_str = ", ".join(sorted_keywords) + ","

    out_file_name = f"sorted-{file_name}"
    with open(out_file_name, "w") as f:
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
