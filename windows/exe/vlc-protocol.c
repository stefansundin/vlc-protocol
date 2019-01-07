#define _WIN32_WINNT 0x0600
#define _WIN32_IE 0x0600

#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <shlwapi.h>
#include <wininet.h>

#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PWSTR pCmdLine, int nCmdShow) {
  if (wcslen(pCmdLine) < 10) return 1;

  // Handle quotes
  if (pCmdLine[0] == '"') {
    pCmdLine++;
    wchar_t *q = wcschr(pCmdLine, '"');
    if (q == NULL) return 1;
    *q = '\0';
  }

  // Strip vlc://
  wchar_t *url = pCmdLine+6;

  // Only allow urls starting with http:// or https://
  if (wcsstr(url,L"http://") != url && wcsstr(url,L"https://") != url) {
    // protocol not allowed
    return 1;
  }

  // Some browsers don't forcibly URL-encode links with unencoded characters, so make sure at least spaces are encoded
  wchar_t encoded_url[INTERNET_MAX_URL_LENGTH];
  DWORD buflen = sizeof(encoded_url)/sizeof(wchar_t);
  UrlEscapeSpaces(url, encoded_url, &buflen);

  // Get vlc.exe path
  wchar_t path[MAX_PATH];
  GetModuleFileName(NULL, path, ARRAY_SIZE(path));
  PathRemoveFileSpec(path);
  wcscat(path, L"\\vlc.exe");

  // Assemble arguments
  wchar_t *args = malloc(sizeof(wchar_t)*(wcslen(encoded_url)+20));
  wcscpy(args, L"--open \"");
  wcscat(args, encoded_url);
  wcscat(args, L"\"");

  // Start vlc.exe
  int ret = (INT_PTR) ShellExecute(NULL, NULL, path, args, NULL, SW_SHOWNORMAL);
  if (ret <= 32) {
    return ret;
  }

  free(args);
  return 0;
}
