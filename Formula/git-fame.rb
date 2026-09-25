class GitFame < Formula
  include Language::Python::Virtualenv

  desc "Pretty-print git repository collaborators sorted by contributions"
  homepage "https://github.com/casperdcl/git-fame"
  url "https://files.pythonhosted.org/packages/8c/fc/4329f146838e542cf21173e735e1715d888d1436359a5132f9b26c6ffd9c/git_fame-4.2.1.tar.gz"
  sha256 "4d37124614c5263ab42d95a43ba167705773ef01a5ed369641257a0d1f96b298"
  license "MPL-2.0"

  depends_on "python@3.13"

  resource "argopt" do
    url "https://files.pythonhosted.org/packages/a3/8c/f1dbbb7ca1b6bdfebd8b3ae1d44f099c5678a1592f1562547037e76330d4/argopt-0.9.1.tar.gz"
    sha256 "29780679f4ff620ffbc897c74415bf99a80fb61c26afdb10fe7aac887efb770e"
  end

  resource "shtab" do
    url "https://files.pythonhosted.org/packages/ef/71/ddb3c0a7a86db44d2fb3f9cbac162f7ddbcbf563b4a174963ba2b3d4d819/shtab-1.12.1.tar.gz"
    sha256 "0637338723a8fc08ed1c2fd826d8432229924649c26e3247bb48c53d60ca3bf9"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/46/58/8c37dea7bbf769b20d58e7ace7e5edfe65b849442b00ffcdd56be88697c6/tabulate-0.10.0.tar.gz"
    sha256 "e2cfde8f79420f6deeffdeda9aaec3b6bc5abce947655d17ac662b126e48a60d"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/0d/ea/b2a5bd54b28a324dae8211928b2d730b6547500342c7e6c6dea08bd0a485/tqdm-4.70.1.tar.gz"
    sha256 "cefd0eca11b2a37a3aee776544d4f4ae913f02688135b5556b8788dfa474afc4"
  end

  def install
    virtualenv_install_with_resources
    generate_completions_from_executable(bin/"git-fame", "--print-completion", shells: [:bash, :zsh])
  end

  test do
    system "git", "init"
    (testpath/"test.txt").write "hello\n"
    system "git", "add", "test.txt"
    system "git", "-c", "user.name=Homebrew Test", "-c", "user.email=test@example.com",
           "commit", "-m", "Initial commit"
    assert_match "Homebrew Test", shell_output(bin/"git-fame")
    assert_match version.to_s, shell_output("#{bin/"git-fame"} --version")
  end
end
