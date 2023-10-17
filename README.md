# docker-teller

This docker image is provided **as-is**. As this is intended for personal use, minimal support will be provided. Feel free to fork this repo and make any changes you would like.

[Teller](https://github.com/danielnguyen/Teller) is a Canadian bank e-statement parser that extracts transaction data from RBC, TD, BMO, Manulife, AMEX and other 🇨🇦 Canadian banks/FI's credit card PDF e-statements to SQLite DB/CSV.

## Usage

```bash
./teller.sh -b <AMEX|BMO|MFC|RBC|TD> -d <statements_dir> [-o <csv_output_path>]
```

### Parameters

`<AMEX|BMO|MFC|RBC|TD>` - Specify your Bank/Financial Institution. Refer to the supported Banks/Financial Institutions [here](https://github.com/danielnguyen/Teller#features-of-this-fork).
`<statements_dir>` - The path to your directory containing your statements. Note: The `teller.sh` script will bind the directory based on the specified Bank/Financial Institution to the required structure as defined [here](https://github.com/danielnguyen/Teller#how-to-use).
`<csv_output_path>` - The path to the output directory. If not specified, the current directory in which the `teller.sh` script is executed from will be used.

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:

```bash
git clone https://github.com/danielnguyen/docker-teller.git
cd docker-teller
docker build \
  --no-cache \
  --pull \
  -t danielnguyen/teller:latest .
```
