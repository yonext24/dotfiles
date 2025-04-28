#include <locale.h>
#include <malloc.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <wchar.h>

// I will treat this as length in wchar_t characters
static size_t MAX_LINE_LENGTH = 4000;

static const wchar_t *top_left_corner = L"┌";
static const wchar_t *top_right_corner = L"┐";
static const wchar_t *bottom_left_corner = L"└";
static const wchar_t *bottom_right_corner = L"┘";
static const wchar_t *left_separator = L"├";
static const wchar_t *right_separator = L"┤";
static const wchar_t *horizontal_line = L"─";
static const wchar_t *vertical_line = L"│";

size_t get_wchar_line(wchar_t **line, size_t max_line_length) {
  char local_line[max_line_length / sizeof(wchar_t)];
  size_t len = 0;
  char c;

  while ((c = fgetc(stdin)) != EOF) {
    if (c == '\n')
      break;
    if (len >= max_line_length)
      return -1;
    local_line[len++] = c;
  }
  local_line[len] = '\0';

  *line = malloc(max_line_length);
  if (!*line) exit(EXIT_FAILURE);

  mbstowcs(*line, local_line, max_line_length);
  return len;
}

wchar_t **get_input(size_t *longest, size_t *arr_len) {
  wchar_t **line_arr = malloc(MAX_LINE_LENGTH);
  size_t wlen = 0;

  while ((wlen = get_wchar_line(&line_arr[*arr_len], MAX_LINE_LENGTH)) != 0) {
    if (wlen > *longest)
      *longest = wlen;
    (*arr_len)++;
  }

  return line_arr;
}

void generate_border(int longest, bool is_top) {
  if (is_top)
    wprintf(L"%ls", top_left_corner);
  else
    wprintf(L"%ls", bottom_left_corner);
  for (int i = 1; i < longest + 2; i++) {
    wprintf(L"%ls", horizontal_line);
  }
  if (is_top)
    wprintf(L"%ls\n", top_right_corner);
  else
    wprintf(L"%ls\n", bottom_right_corner);
}

int main(int argc, char *argv[]) {
  setlocale(LC_ALL, "");
  fwide(stdout, 1);

  size_t longest = 0, arr_len = 0;
  wchar_t **lines = get_input(&longest, &arr_len);
  generate_border(longest, true);

  for (int i = 0; i < arr_len; i++) {
    wprintf(L"%ls %ls", vertical_line, lines[i]);
    for (int j = 0; j < longest - wcslen(lines[i]); j++) {
      wprintf(L" ");
    }
    wprintf(L"%ls\n", vertical_line);
  }

  generate_border(longest, false);

  return 0;
}
