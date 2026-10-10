# Neovim: a workflow to remember

**Find → understand → edit → check → format → review → commit.**

Imagine fixing a bug that touches an implementation and its tests. Follow that
same loop each time; learn the shortcuts as you need them, not all at once.

## How to read the keys

- `Space pf` means tap Space, then p, then f. Don't hold them together.
- `Ctrl-p` means hold Ctrl and press p.
- Capitals matter: `J` means Shift-j; `Space gD` ends with Shift-d.
- Unless marked insert or visual, start in normal mode. Press Esc to get there.
- Commands like `:w` mean type the command, then press Enter.

Memory cues for this config:

| Family | Think |
|---|---|
| `Space p…` | **Pick**: files, buffers, or search results |
| `Space v…` | Language tools: **d**iagnostics, **c**ode **a**ction, **r**e**n**ame |
| `Space g…` | **Git**: **s**tatus, **d**iff, **w**rite/stage, **c**ommit, **p**ush |
| `Space b…` | **Buffer** management |

## 1. Find the place to work

Use `Space pf` when you know the file's name. If you only have a phrase from
the bug report, use `Space pg` and search for that phrase.

| Keys | What you do | Memory cue |
|---|---|---|
| `Space pf` | Find a file by name | **p**ick **f**ile |
| `Ctrl-p` | Find a file in the Git repository | Fast file picker |
| `Space pg` | Search text across the project as you type | **p**ick **g**rep result |
| `Space pv` | Browse directories with Netrw | Browse instead of searching |

In Telescope, type a few characters, use Ctrl-n / Ctrl-p to move down / up,
and press Enter to open the selection. Esc leaves insert mode; another
Esc closes the picker. Project text search requires `rg` (ripgrep).

## 2. Follow the code, then find your way back

Put the cursor on the function you suspect. `K` tells you about it;
`gd` takes you to its definition. After reading, `Ctrl-o` brings you back.

| Keys | What you do | Memory cue |
|---|---|---|
| `K` | Read hover information | Look before changing |
| `gd` | Jump to definition | **g**o to **d**efinition |
| `gr` | Find references | **g**o to **r**eferences |
| `gi` / `gt` | Jump to implementation / type definition | **i**mplementation / **t**ype |
| `Ctrl-o` / `Ctrl-i` | Go back / forward through jump history | Out of the jump / into it again |
| `/text`, then Enter | Search inside the current file | Local search |
| `n` / `N` | Next / previous search match, centered | Next / reverse next |
| `Space /` | Clear search highlighting | Finished searching |
| `Ctrl-d` / `Ctrl-u` | Scroll half a page down / up, centered | **d**own / **u**p |

Search ignores case unless your query contains a capital letter.
`gd`, `gr`, and the other language tools need a supporting language server.

## 3. Keep the implementation and tests close

Open the test file with `Space pf`. Both files are now buffers: open files
that don't need to be visible all the time.

Use `Space pb` for the whole working set, or `Ctrl-6` to alternate
between the two files you're using right now.

| Keys | What you do | Memory cue |
|---|---|---|
| `Space pb` | Search open buffers, most recent first | **p**ick **b**uffer |
| `Ctrl-6` (also `Ctrl-^`) | Switch to the alternate file | Two-file toggle |
| `:vsplit` | Show the current file in a second, side-by-side window | Compare implementation and tests |
| `Ctrl-w h/j/k/l` | Move between windows: left/down/up/right | Window + direction |
| `Space q` | Close a window, not necessarily its buffer | **q**uit this view |
| `Space bd` | Remove a buffer from the working set | **b**uffer **d**elete |

`Ctrl-o` retraces where you jumped; `Ctrl-6` toggles files;
`Space pb` picks any open file. Closing a window doesn't remove its buffer.
Save with `:w` before `Space bd`; it won't force-discard unsaved changes.

## 4. Make the change

Change a word with built-in `ciw` (change inside word), type the replacement,
then `jk` to return to normal mode. For a symbol used in several places,
prefer `Space vrn` over a text replacement.

| Keys | What you do | Memory cue |
|---|---|---|
| `Space vrn` | Rename a symbol through the language server | **r**e**n**ame |
| `Space s` | Prepare whole-buffer replacement of the word under the cursor | **s**ubstitute; edit replacement before Enter |
| `gcc` | Toggle a comment on this line | **c**omment current line |
| `gc` (**visual**) | Toggle comments on selected lines | Comment selection |
| `gc{motion}` | Comment a motion, e.g. `gcip` for the paragraph | Comment a region |
| `J` / `K` (**visual**) | Move selected lines down / up | Same direction as j / k |
| `J` (**normal**) | Join lines while preserving cursor position | **J**oin |
| `Space o` / `Space O` | Add a blank line below / above, stay in normal mode | Like o / O, without entering insert |
| `u` / `Ctrl-r` | Undo / redo (built-in) | Undo first; inspect history if needed |
| `Space u` | Open Undotree to explore older edits | **u**ndo history |

### Add or change quotes without retyping

| Keys | Example | Memory cue |
|---|---|---|
| `ysiw"` | Wrap the current word in double quotes | Add surround to **i**nside **w**ord |
| `cs"'` | Change double quotes to single quotes | **c**hange **s**urround |
| `ds"` | Remove surrounding double quotes | **d**elete **s**urround |
| `S"` (**visual**) | Wrap the selection in double quotes | Surround selection |

General forms: `ys{motion}{char}`, `cs{old}{new}`, `ds{char}`, and visual `S{char}`.

### Copy something without losing your previous yank

| Keys | What you do |
|---|---|
| `Space y` (**visual**) / `Space yy` (**normal**) | Copy selection / line to the system clipboard |
| `Space Y` | Copy the whole line to the system clipboard (same as `Space yy`) |
| `Space p` (**visual**) | Replace selection with a paste, without overwriting the yank register |
| `Space d` (**visual**) / `Space dd` (**normal**) | Delete selection / line without yanking |

In normal mode, `Space y` and `Space d` also accept motions, like `Space yiw`.

### Ask for completion while typing

In insert mode, `Ctrl-Space` requests LSP suggestions. Use `Ctrl-n`
or `Ctrl-p` to choose, then `Ctrl-y` to accept. `Ctrl-e` dismisses them.

- `Ctrl-x`, then `Ctrl-o`: another way to request LSP completion.
- `Ctrl-x`, then `Ctrl-f`: complete a file path.
- Suggestions may appear automatically after server-defined characters such as `.`.
- Enter and Tab keep their normal behavior; no AI suggestions are configured.
- Esc, `jk`, `kj`, or Ctrl-c return to normal mode.

Normal-mode Ctrl-p opens Git files; insert-mode Ctrl-p navigates
completion suggestions.

## 5. Check what's wrong

After the edit, `]d` jumps to the next diagnostic. `Space vd` reads it;
`Space vca` asks whether the server can fix it.

| Keys | What you do | Memory cue |
|---|---|---|
| `]d` / `[d` | Next / previous diagnostic | **d**iagnostic; right bracket goes forward |
| `Space vd` | Open diagnostic details | **d**etails |
| `Space vca` | Request a code action | **c**ode **a**ction |
| `Space vq` | Put current-buffer diagnostics in a location list | Gather a list |
| `:lopen` / `:lclose` | Open / close that location-list window | **l**ocation list |
| `Space k` / `Space j` | Next / previous location-list entry | Your existing list-navigation pair |

If a command or tool has populated quickfix, use `:copen` / `:cclose` to view
it and Ctrl-k / Ctrl-j for next / previous entries. Those keys navigate
quickfix here, not window splits; use Ctrl-w plus a direction for splits.

Diagnostics aren't a substitute for running your project's tests in your terminal.

## 6. Format, save, and review

The edit works and the tests pass. `Space =` cleans up formatting; `:w`
saves it. Switch to each changed buffer with `Space pb` and repeat.

- Python: Neoformat runs Ruff. Pyright handles type information, not formatting.
- Other filetypes: formatting uses a language server that supports it.
- Formatting is manual; **saving does not run the formatter**.
- Ruff is installed through Mason on this machine. On another setup, use
  `:MasonInstall ruff` or provide `ruff` on PATH.

Now inspect before staging:

| Keys | What you do | Memory cue |
|---|---|---|
| `Space gs` | Open Fugitive's Git status | **g**it **s**tatus |
| `Space gd` | Compare current file with the index in a vertical diff | **d**iff this file |
| `Space gD` | Inspect the repository diff | Capital D: bigger scope |
| `Space gw` | Write and stage the whole current file | **w**rite to index |
| `Space gc` | Start a commit | **c**ommit |
| `Space gp` | Push when you're ready | **p**ush |

To finish: `Space =` → `:w` → `Space gs` → review diffs →
`Space gw` for each intended file → `Space gc` → optionally `Space gp`.
Don't stage unrelated edits just because they're open in a buffer.

## 7. Leave a tidy working set

Use `Space bd` for files you're done with. Keep the implementation and tests
open if you'll return to them. Next time, `Space pb` is your starting point.

Use `Space ?` to open this guide in a split. Close that split with
`Space q` when you're done.

## Occasional shortcuts: look these up, don't memorize them first

| Keys / command | Action |
|---|---|
| `Space ps` | Search the project for text entered in a prompt |
| `Space pws` / `Space pWs` | Project search for word / WORD under cursor; WORD includes punctuation |
| `Space vws` | Search workspace symbols |
| `Space vrr` | Find references; same purpose as `gr` |
| `Space mp` | Toggle inline Markdown rendering; **m**arkdown **p**review |
| `Space x` | Make current file executable |
| `:Git blame` / `:Git log` | Inspect authorship / history |
| `Space gP` | Pull with rebase; capital P pulls rather than pushes |
| `Space gt` | Start `git push -u origin`; enter the branch name before Enter |
| `Space gri` | Start interactive Git rebase |
| `gu` / `gh` | Take ours / theirs in Fugitive's three-way conflict view |
| `Q` | Disabled to avoid accidentally entering Ex mode |

### Git shortcuts to use deliberately

- `Space gr` runs `Gread`: replaces the buffer with the index version and
  **discards current buffer edits**. It is not the same as `gr` (references).
- `Space gC` amends the last commit. Use only when you intend to rewrite it.
- `Space gf` pushes with force-with-lease. It can rewrite remote history;
  it is not your everyday push shortcut.

## Learn this small loop first

`Space pf` find → `gd` understand → `Ctrl-o` return →
`Space pb` switch → `]d` check → `Space =` format → `:w` save.

Once that feels automatic, add Git and the editing shortcuts you reach for most.
