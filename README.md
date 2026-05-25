# Web Terminal Simulator (Under Development)

**Web Terminal Simulator** is a secure, interactive web application built on the modern **Rails 8.1.3** stack. It provides users with a responsive, browser-based Linux terminal simulation, enabling them to run a controlled set of shell utilities directly from the web interface.

---

##  Project Description

The heart of the application is an API-driven backend managed by `TerminalController#execute`. Because exposing a system shell to the web carries extreme inherent risks, this project is built from the ground up with a **Security-First / Zero-Trust** approach to command execution:

* **Strict Whitelisting:** The application tokenizes user input and compares the primary command against an isolated array of permitted utilities (`ls`, `pwd`, `whoami`, `echo`, `help`). Any unlisted utility is instantly dropped.
* **Injection Mitigation:** The execution wrapper rejects multi-command syntax chaining (e.g., `;`, `&&`, `|`) and avoids passing raw user arguments directly into system execution backticks, ensuring the host environment remains entirely safe from Remote Code Execution (RCE).
* **Asynchronous JSON Responses:** The terminal returns uniform JSON payloads containing either the sanitized standard output (`stdout`) or a standardized error message, making it incredibly easy to parse on the frontend.

---

##  System Dependencies & Ruby Version

* **Ruby Version:** `4.0.4`
* **Framework:** Rails `8.1.3`
* **Database:** SQLite 3 (`>= 2.1`)
* **Asset Pipeline:** Propshaft
* **Frontend Tools:** Hotwire (Importmaps, Turbo, and Stimulus)
* **System Dependencies:** * Linux/macOS environment (recommended for running native shell commands like `ls`, `pwd`, `whoami`).
  * Docker (required only for production deployment via Kamal).

---

##  Configuration & Setup

### 1. Environment Configuration
Clone the repository and install the application dependencies using Bundler:
```bash
bundle install
