#!/bin/bash

xournalpp "$1" && xournalpp "$1.xopp" -p "$1-output.pdf"
