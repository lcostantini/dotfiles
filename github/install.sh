#!/usr/bin/env bash
set -e

echo "⚙️  Stow git config..."
stow -v -t "${HOME}" git

# === CONFIG ===
GITHUB_EMAIL_NO_REPLY="4202315+lcostantini@users.noreply.github.com"
SSH_KEY_PATH="$HOME/.ssh/id_ed25519_github"

echo "🚀 Setting up GitHub identity with no-reply email: $GITHUB_EMAIL_NO_REPLY"

# === Generate SSH key ===
if [[ ! -f "$SSH_KEY_PATH" ]]; then
  echo "------> 🔐 Generating SSH key..."
  ssh-keygen -t ed25519 -C "$GITHUB_EMAIL_NO_REPLY" -f "$SSH_KEY_PATH"
  eval "$(ssh-agent -s)"
  ssh-add "$SSH_KEY_PATH"
else
  echo "------> ✅ SSH key already exists at $SSH_KEY_PATH"
fi

# === Generate or reuse GPG key ===
EXISTING_KEY=$(gpg --list-secret-keys --keyid-format=long "$GITHUB_EMAIL_NO_REPLY" 2>/dev/null | awk '/^sec/ {print $2}' | cut -d'/' -f2)

echo
if [[ -z "$EXISTING_KEY" ]]; then
  echo "------> 🔐 Generating new GPG key..."
  echo "💡 Use all defaults when prompted"
  echo "💡 For email use $GITHUB_EMAIL_NO_REPLY"
  echo
  gpg --full-generate-key
else
  echo "------> ✅ GPG key already exists for $GITHUB_EMAIL_NO_REPLY"
fi

# === Extract key ID again
KEY_ID=$(gpg --list-secret-keys --keyid-format=long "$GITHUB_EMAIL_NO_REPLY" | awk '/^sec/ {print $2}' | cut -d'/' -f2)

# === Configure Git
echo
echo "------> 🛠️ Configuring Git with GPG signing..."
git config --global user.signingkey "$KEY_ID"

echo
echo "------> 🎯 Final GitHub setup checklist:"
echo "1️⃣. Paste SSH key into:"
echo "   https://github.com/settings/ssh/new"
echo "   Copy with:"
echo "   xclip -sel clip < ${SSH_KEY_PATH}.pub"
echo
echo "2️⃣. Paste GPG key into:"
echo "   https://github.com/settings/gpg/new"
echo "   Copy with:"
echo "   gpg --armor --export "$KEY_ID" | xclip -sel clip"
echo
echo "✅ Git is now configured to sign commits using this key."
echo "🧪 Test SSH with: ssh -T git@github.com"
