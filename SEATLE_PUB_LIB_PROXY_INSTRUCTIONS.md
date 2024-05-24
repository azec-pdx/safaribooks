

# Instructions for using with Seattle Public Library EZ Proxy For O'Reilly


In order do be able to use this `.epub` format downloader with EZ Proxy for O'Reilly available through the Seattle Public Library, please follow the steps below.


1. Install [ExportThisCookie for Chrome](https://chromewebstore.google.com/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg?hl=en&pli=1) plugin


2. In Chrome, go to [EZ Proxy Login Page](https://ezproxy.spl.org/login?url=https://www.oreilly.com/library/view/temporary-access) and login with your Seattle Public Library Credentials

      ![Login to Seattle Pub Lib EZ Proxy Login Page](/img/spl_login.png)

3. Once logged in successfuly, go to your profile page by clicking avatar in the upper right corner and selecting Profile from the popup menu. This is for the purpose of exporting cookies properly in the next step.

      ![Open Profile Page In OReilly](/img/oreilly_profile.png)

4. Once on the profile page, click on ExportThisCookie Chrome plugin icon and then click **Export**. This should save `cookies.txt` in your `~/Downloads` directory
    
      ![Export Cookies from Chrome](/img/cookies_oreilly_profile.png)

5. Verify that cookies are exported in `~/Downloads/cookies.txt`

6. From root directory of this project, in the console, run:
 
      ```bash
      ./copy-cookies.sh
      ```

   This will transform `cookies.txt` into `cookies.json` and copy it to this project root, ready for script's authentication.

7. Request EPUB download with flag `--use-spl` and watch the progress. Script `safaribooks.py` should be able to pick up authentication session based on the `cookies.json` present in the project root

      ![Request Download of EPUB](/img/epub_download_in_progress.png)
    
8. Once the raw EPUB is downloaded (by default it gets stored in `<project_base>/Books` directory), you should run it through [Kindle EPUB Fix](https://kindle-epub-fix.netlify.app/)
9. Once [Kindle EPUB Fix](https://kindle-epub-fix.netlify.app/) produces fixed version, you should download it and then import it in Calibre.
10. In Calibre request another conversion (from fixed EPUB to EPUB again). This will ensure Calibre further formats fixed EPUB in a proper format that is readable on MacOS EPUB readers such as [Apple Books](https://apps.apple.com/us/app/apple-books/id364709193) or [Yomu](https://apps.apple.com/us/app/yomu-ebook-reader/id562211012) app like any other EPUB. However, if you need Kindle edition of EPUB, you need to request that from this script by passing `--kindle` option as described in main [README](https://github.com/lorenzodifuccia/safaribooks?tab=readme-ov-file#use-or-not-the---kindle-option).
