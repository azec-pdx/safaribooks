import json

# See: https://github.com/lorenzodifuccia/safaribooks/issues/358

try:
    from safaribooks import COOKIES_FILE
except ImportError:
    COOKIES_FILE = "cookies.json"

try:
    import browser_cookie3

except ImportError:
    raise ImportError(
        "Please run this program via: uv run --with browser_cookie3 python retrieve_cookies.py"
    )


def get_oreilly_cookies():
    domains = [
        "learning-oreilly-com.ezproxy.spl.org",
        "www-oreilly-com.ezproxy.spl.org",
        ".ezproxy.spl.org",
        ".spl.org",
        ".www.spl.org",
    ]
    cookies = {}
    for d in domains:
        cj = browser_cookie3.chrome(domain_name=d)
        for c in cj:
            cookies[c.name] = c.value
    return cookies


def main():
    cookies = get_oreilly_cookies()
    with open(COOKIES_FILE, "w") as f:
        json.dump(cookies, f)
    print(f"Cookies saved to {COOKIES_FILE}")


if __name__ == "__main__":
    main()
