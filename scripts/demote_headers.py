#!/usr/bin/env python3
"""
Demote all markdown headers in a file by one level.
# becomes ##, ## becomes ###, etc.
"""

import re
import sys


def has_h1_headers(content):
    """Check if content contains any H1 headers (^# )."""
    return re.search(r'^# ', content, flags=re.MULTILINE) is not None


def demote_headers(content):
    """Replace all headers by adding one # to the beginning."""
    def replace_header(match):
        hashes = match.group(1)
        rest = match.group(2)
        return '#' + hashes + rest
    
    # Pattern: start of line, one or more #'s, space, then rest of line
    pattern = r'^(#+)( .*)$'
    return re.sub(pattern, replace_header, content, flags=re.MULTILINE)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python demote_headers.py <markdown_file> [markdown_file ...]")
        sys.exit(1)
    
    filepaths = sys.argv[1:]
    
    for filepath in filepaths:
        try:
            with open(filepath, 'r') as f:
                content = f.read()
        except FileNotFoundError:
            print(f"Error: File '{filepath}' not found")
            continue
        
        # Check if file contains H1 headers
        if not has_h1_headers(content):
            print(f"File '{filepath}' is already conformant (no H1 headers found). Skipping.")
            continue
        
        # File has H1 headers, demote all headers
        new_content = demote_headers(content)
        
        with open(filepath, 'w') as f:
            f.write(new_content)
        
        print(f"Headers demoted in {filepath}")
