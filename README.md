# Week 7B Starter - IGME-340

External data day. We'll poke at an API in Hoppscotch before writing any code, try `async`/`await` in DartPad, then come back here and pull real data from DummyJSON into a scrolling list. This is the same shape every API call in Lab 04 and Project 2 will take: fetch, decode, store in state, display.

`lib/main.dart` starts as a `MainPage` StatefulWidget with an AppBar, a button, and a gray placeholder box. The `TODO` comments are numbered to match the steps we do in class.

---

## I. Get the Code

**Work in your own repo, not the template.** Accepting the assignment creates a repo just for you, named `igme-340-week-7b-starter-<your-github-username>`. Don't fork `IGME-340/week7b_starter` or click "Use this template" on it. I can't see work pushed anywhere else, so it won't count.

Three ways, all worth the same credit. Use whichever you already know:

- **GitHub Desktop:** clone your repo, then open the folder in VS Code.
- **Command line:** copy the URL from the green **Code** button, then `git clone <your-repo-url>`.
- **Neither one cooperating?** Skip cloning and edit your files directly on GitHub.com. Full credit, no penalty.

Step by step for all three: [Participation Repos](https://github.com/jptweb/IGME-340-Shared/blob/main/documents/participation.md).

Once it's on your machine, open the folder in VS Code. Make sure you open the folder that *contains* `pubspec.yaml`, not the one above it. Opening the parent folder is the most common way this goes wrong, and the error you get looks completely unrelated to the real cause.

**Don't clone into a path with spaces.** `Documents/IGME 340/` will cause failures later that have nothing to do with your code. Use something like `Documents/igme-340/`.

---

## II. Run It

```bash
flutter pub get
flutter run
```

The Android emulator is the safest choice today. Chrome works with DummyJSON, but some APIs block browser requests (see Section V).

---

## III. Follow Along in Class

Everything today happens in `lib/main.dart`, plus one package. Before we write the fetch function, add `http` from pub.dev. In the terminal, inside the project folder:

```bash
flutter pub add http
```

Then uncomment the `http` import at the top of `main.dart`. That command edits `pubspec.yaml` for you, which is expected. Commit `pubspec.yaml` along with `main.dart`. **Hot restart** after adding a package (hot reload isn't enough).

We'll leave `dart:convert` out on purpose. When `jsonDecode` turns red, use **Cmd+.** (Mac) or **Ctrl+.** (Windows) to import it.

| What | What it does |
|---|---|
| `Future<void>` | A function that finishes later. The return type of anything `async`. |
| `async` / `await` | `await` pauses the function until the Future is done. You can only use it inside an `async` function. |
| `http.get(Uri.parse(url))` | Sends a GET request. It takes a `Uri`, not a plain string. |
| `response.statusCode` | `200` means it worked. Check it before you trust the body. |
| `response.body` | The raw JSON, as one long `String`. |
| `jsonDecode(response.body)` | Turns that string into Dart Maps and Lists you can index into. |
| `setState()` | Tells Flutter your data changed so it redraws. Forget it and the list stays empty. |
| `Expanded` | Fills whatever space is left in a `Column`, so you don't have to guess a height. |
| `ListView.builder` | Builds one list item per index from your data. |
| `initState()` | Runs once when the screen first loads. It can't be `async`, so it calls an async helper. |

---

## IV. Commit and Push

### How this one is graded

To get credit, your pushed code has to show today's work:

- an `async` function that calls `http.get` and runs the response through `jsonDecode`
- a `ListView.builder` that shows the data you fetched (stored with `setState`)

`initState` is welcome but not required. It doesn't need to be finished, and it doesn't need to look like mine. An untouched starter or a "Hello World" commit doesn't count.

**Missed class?** You can still earn it. The [Week 7B notes](https://github.com/jptweb/IGME-340-Shared/blob/main/weekly/7B.md) have the code for every piece.

**Push before the start of our next class** (Thursday Oct 15, since Tuesday is October Break). Pushing at the end of class is a good habit, so do that too.

### How to push

**GitHub Desktop:** write a summary, click **Commit to main**, then **Push origin**.

**Command line:**

```bash
git add .
git commit -m "Week 7B in-class work"
git push
```

**If push is fighting you:** open `lib/main.dart` on GitHub.com, click the pencil, paste your code in, and commit there. Same credit.

---

## V. If Something Goes Wrong

| Problem | What to do |
|---|---|
| "Target of URI doesn't exist: 'package:http/http.dart'" | Run `flutter pub add http` inside the folder that has `pubspec.yaml`, then hot **restart**. If the red squiggle stays, run `flutter pub get`. |
| "The argument type 'String' can't be assigned to the parameter type 'Uri'" | Wrap the URL: `http.get(Uri.parse(url))`. |
| "Undefined name 'jsonDecode'" | Put your cursor on it and press Cmd+. or Ctrl+. to import `dart:convert`. |
| I see `Instance of 'Future<void>'` instead of data | Something is missing an `await`. |
| The data prints in the console but the list stays empty | The assignment to `cartsList` has to be inside `setState(() { ... })`. |
| Red screen: "Vertical viewport was given unbounded height" | The `ListView` needs a height. Wrap its parent in `Expanded` (or give the `Container` a `height:`). |
| My `ListTile` colors don't show, or the console warns "ListTile background color or ink splashes may be invisible" | Same issue as 6B. `ListTile` paints `tileColor` on the nearest `Material`, so a colored `Container` around the list hides it. Put the background color on a `Material` instead of the `Container`. |
| `initState` won't compile when I add `async` | Don't make `initState` async. Have it call a separate `async` function. |
| `ClientException: Failed to fetch` in Chrome | The browser blocked the request (CORS). DummyJSON allows it, so check the URL first. For other APIs, run on the Android emulator, where CORS doesn't apply. |
| Running as a macOS desktop app and the request fails with "Operation not permitted" | This template already turns on the network permission for macOS. If you started from a fresh `flutter create`, see the [Week 8B notes](https://github.com/jptweb/IGME-340-Shared/blob/main/weekly/8B.md). |
| Blue squiggle under `print` | That's a lint suggestion, not an error. Your code still runs. |
| `git push` asks for a password | GitHub wants a token, not your account password. Easiest fix is to install [GitHub CLI](https://cli.github.com) and run `gh auth login`. |
| `flutter pub get` complains about SDK versions | Run `flutter --version` and send me the output on Slack. This template is built to accept a wide range, so this one is worth reporting. |
| Something else | Slack me. Don't sit on it quietly, a broken environment compounds fast. |
