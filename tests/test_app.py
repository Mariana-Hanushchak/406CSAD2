from src.app import get_greeting, main


def test_get_greeting_returns_hello_world():
    assert get_greeting() == "Hello, World!"


def test_main_prints_hello_world(capsys):
    main()
    captured = capsys.readouterr()
    assert captured.out == "Hello, World!\n"
