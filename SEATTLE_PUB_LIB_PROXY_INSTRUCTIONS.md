

# Instructions for using with Seattle Public Library EZ Proxy For O'Reilly


In order do be able to use this `.epub` format downloader with EZ Proxy for O'Reilly available through the Seattle Public Library,
please follow the steps below.


1. In your browser of choice, go to [EZ Proxy Login Page](https://ezproxy.spl.org/login?url=https://www.oreilly.com/library/view/temporary-access) and login with your Seattle Public Library Credentials

    ![Login to Seattle Pub Lib EZ Proxy Login Page](/img/spl_login.png)

2. Run `retrieve_cookies.py` to obtain all cookies for domains relevant to Seattle Public Library EZ Proxy for O'Reilly:
   
   ```bash
   python retrieve_cookies.py
   ```

3. Verify that you have all of the following cookie key-value pairs in `cookies.json`:
   
   ```json
    {
        "akaalb_LearningALB": "<REDACTED_VALUE>",
        "_dd_s": "<REDACTED_VALUE>",
        "akaalb_OReillyALB": "<REDACTED_VALUE>",
        "_gd_session": "<REDACTED_VALUE>",
        "_gd_visitor": "<REDACTED_VALUE>",
        "ezproxy": "<REDACTED_VALUE>",
        "ezproxyl": "<REDACTED_VALUE>",
        "ezproxyn": "<REDACTED_VALUE>",
        "_ga_PTT45DL4YD": "<REDACTED_VALUE>",
        "_vis_opt_s": "<REDACTED_VALUE>",
        "_vis_opt_test_cookie": "<REDACTED_VALUE>",
        "_vwo_ds": "<REDACTED_VALUE>",
        "_vwo_uuid": "<REDACTED_VALUE>",
        "_vwo_uuid_v2": "<REDACTED_VALUE>",
        "_ga": "<REDACTED_VALUE>",
        "_ga_80H2GZBN7M": "<REDACTED_VALUE>",
        "TS0198123f": "<REDACTED_VALUE>"
    }
   ```

4. Request EPUB download with flag `--use-spl` and watch the progress. Script `safaribooks.py` should be able to pick up authentication session based on the `cookies.json` present in the project root

      ![Request Download of EPUB](/img/epub_download_in_progress.png)
    
5. Once the raw EPUB is downloaded (by default it gets stored in `<project_base>/Books` directory), you should run it through [Kindle EPUB Fix](https://kindle-epub-fix.netlify.app/)
6. Once [Kindle EPUB Fix](https://kindle-epub-fix.netlify.app/) produces fixed version, you should download it and then import it in Calibre.
7. In Calibre request another conversion (from fixed EPUB to EPUB again). This will ensure Calibre further formats fixed EPUB in a proper format that is readable on MacOS EPUB readers such as [Apple Books](https://apps.apple.com/us/app/apple-books/id364709193) or [Yomu](https://apps.apple.com/us/app/yomu-ebook-reader/id562211012) app like any other EPUB. However, if you need Kindle edition of EPUB, you need to request that from this script by passing `--kindle` option as described in main [README](https://github.com/lorenzodifuccia/safaribooks?tab=readme-ov-file#use-or-not-the---kindle-option).
