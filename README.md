# vim-chatgpt

Vim plugin for ChatGPT

- Please refer to the original source code [here](https://github.com/mattn/vim-chatgpt).

## Requirements

<https://github.com/zuizui-kuroiko/chatgpt>

## Installation

For [vim-plug](https://github.com/junegunn/vim-plug) plugin manager:

```
Plug 'zuizui-kuroiko/vim-chatgpt'
```

## Usage

The plugin offers the following commands for interacting with ChatGPT:

(1) `:Chat '<prompt>'` Sends your raw prompt to the ChatGPT API.
To use this command, type :Chat followed by your prompt.

(2) `:<>Ask '<context>'` If there is no additional context, the code highlighted in the request will be sent to ChatGPT.
The additional context specifies the content of the request to ChatGPT. (The highlighted code is also sent to ChatGPT after the additional context.)
To use these commands (:Ask :Review :Explain, or :Rewrite), visually select the lines of code you want to interact with, then type the desired command and press Enter.

(3) `:<>Review` Sends the highlighted code to ChatGPT and requests a review.
To use these commands (:Explain, :Review, :Rewrite, or :MakeTest), visually select the lines of code you want to interact with, then type the desired command and press Enter.

(4) `:<>Explain '<context>'` Sends the highlighted code to ChatGPT and requests an explanation, with the option to include additional context.

(5) `:<>Rewrite '<context>'` Sends the highlighted code to ChatGPT and requests a rewritten version, with the option to include additional context.

(6) `:<>MakeTest '<context>'` Sends the highlighted code to ChatGPT and requests it writes a test, with the option to include additional context.

(7) `:<>Fix '<context>'` Sends the highlighted code to ChatGPT and that it fixes any errors it may find, with the option to include additional context.

## License

MIT

## Author
Copyright(c) 2023 ZuiZui.Kuroiko

This software contains code derived from the code Yasuhiro Matsumoto (a.k.a. mattn) wrote.
