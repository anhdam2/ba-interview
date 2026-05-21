#!/bin/bash
# Setup script for ba-interview Claude Code skill
# Installs the skill globally to ~/.claude/skills/ba-interview/

set -e

SKILL_DIR="$HOME/.claude/skills/ba-interview"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Installing ba-interview skill ==="
echo ""

# 1. Create skill directory structure
echo "[1/4] Creating directory structure..."
mkdir -p "$SKILL_DIR/references"
mkdir -p "$SKILL_DIR/scripts"

# 2. Copy skill files
echo "[2/4] Copying skill files..."
cp "$SCRIPT_DIR/SKILL.md" "$SKILL_DIR/SKILL.md"
cp "$SCRIPT_DIR/references/question-bank.md" "$SKILL_DIR/references/question-bank.md"
cp "$SCRIPT_DIR/references/scoring-template.md" "$SKILL_DIR/references/scoring-template.md"
cp "$SCRIPT_DIR/references/stimulation-leadership.md" "$SKILL_DIR/references/stimulation-leadership.md"
cp "$SCRIPT_DIR/scripts/pdf2md.py" "$SKILL_DIR/scripts/pdf2md.py"

# 3. Ensure Python venv has pymupdf4llm (needed for PDF conversion)
echo "[3/4] Checking Python dependencies..."
VENV_DIR="$HOME/.claude/skills/.venv"

if [ ! -d "$VENV_DIR" ]; then
    echo "  Creating Python venv at $VENV_DIR..."
    python3 -m venv "$VENV_DIR"
fi

if ! "$VENV_DIR/bin/python3" -c "import pymupdf4llm" 2>/dev/null; then
    echo "  Installing pymupdf4llm..."
    "$VENV_DIR/bin/pip" install --quiet pymupdf4llm
else
    echo "  pymupdf4llm already installed."
fi

# 4. Verify installation
echo "[4/4] Verifying installation..."
EXPECTED_FILES=(
    "$SKILL_DIR/SKILL.md"
    "$SKILL_DIR/references/question-bank.md"
    "$SKILL_DIR/references/scoring-template.md"
    "$SKILL_DIR/references/stimulation-leadership.md"
    "$SKILL_DIR/scripts/pdf2md.py"
)

ALL_OK=true
for f in "${EXPECTED_FILES[@]}"; do
    if [ ! -f "$f" ]; then
        echo "  MISSING: $f"
        ALL_OK=false
    fi
done

if [ "$ALL_OK" = true ]; then
    echo ""
    echo "=== Installation complete ==="
    echo ""
    echo "Usage (from ba-interview project root):"
    echo "  /ba-interview CV/377.md                  → Generate interview questions"
    echo "  /ba-interview Transcript/file.md         → Score transcript"
    echo "  /ba-interview compare Scoring/a.md b.md  → Compare candidates"
    echo "  /ba-interview                            → Interactive menu"
    echo ""
else
    echo ""
    echo "ERROR: Some files are missing. Please check the source directory."
    exit 1
fi
