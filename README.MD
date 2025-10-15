# 🔒 Precommit API Key Scanner

A simple Bash script that scans staged files before every Git commit to detect potential API keys or secrets.  
This helps prevent accidentally pushing sensitive credentials to your repository.

---

## 🧠 Purpose

Committing API keys or tokens by mistake can expose your credentials publicly, leading to serious security risks.  
This script acts as a safety check before commits — it searches staged files to make sure API keys are not being committed.

---

## 🧪 Testing the Script

You can test the script locally. 
The script scans **staged files** for strings matching the pattern `[A-Za-z0-9_]{20,}` (20 or more alphanumeric or underscore characters).

---

### 1️⃣ Create a Test File

Create a simple text file that includes a fake API key-like string.

```bash
echo "THIS_IS_A_FAKE_KEY_ABC12345" > test.txt
cat test.txt
```
---

### 2️⃣ Stage the File

Since the script scans staged files, add the file to Git staging:

```bash 
git add test.txt
```
---

### 3️⃣ Run the Script

Run the script directly to test it:

```bash
./precommit-scan.sh -v
```



