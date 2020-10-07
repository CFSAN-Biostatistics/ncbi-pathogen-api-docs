# ncbi-pathogen-api-docs
Repository for [samizdat](http://www.catb.org/jargon/html/S/samizdat.html) about NCBI's undocumented Pathogen API.

*note* For large batch jobs, please download from the ftp site and run operations locally.
ftp://ftp.ncbi.nlm.nih.gov/pathogen/

## API Endpoint URL


[https://www.ncbi.nlm.nih.gov/Structure/pathogen/tree/tree_srv.cgi](https://www.ncbi.nlm.nih.gov/Structure/pathogen/tree/tree_srv.cgi)


# Parameters

## Action

### getneighbors

Retrieve neighboring nodes in the tree within `distance` from `accessions`.

[https://www.ncbi.nlm.nih.gov/Structure/pathogen/tree/tree_srv.cgi?action=getneighbors&distance=4&accessions=PDT000608728.1,SAMN13035591,PDT000608727.1,FSIS21821478,qqq](https://www.ncbi.nlm.nih.gov/Structure/pathogen/tree/tree_srv.cgi?action=getneighbors&distance=4&accessions=PDT000608728.1,SAMN13035591,PDT000608727.1,FSIS21821478,qqq)

# Schema

JSON Schema to follow if we can figure out what it is.

# Using APIs

```python

import requests # seriously, use requests

accessions = [
    'PDT000608728.1',
    'SAMN13035591',
    'PDT000608727.1',
    'FSIS21821478',
    'qqq'
]

response = requests.get(
    "https://www.ncbi.nlm.nih.gov/Structure/pathogen/tree/tree_srv.cgi",
    params=dict(
        action='getneighbors',
        distance=4,
        accessions=",".join(accessions)
    )
)

records = response.json()

```

