# Intentional errors: analyzed by Pyright, never executed.
# pyright: strict
from abc import ABC, abstractmethod
from typing import Final, NotRequired, TypedDict, overload
import python_errors_nonexistent_package


def repeat(count: int) -> str:
    return str(count)


repeat("wrong")
repeat()
repeat(total=3)
repeat(3, count=4)
count: int = "wrong"
print(undefined_name)


def bad_return() -> int:
    return "wrong"


def missing_return(flag: bool) -> int:
    if flag:
        return 1


def maybe_value(flag: bool) -> None:
    if flag:
        value = "ready"
    print(value)


def optional_value(value: str | None) -> None:
    print(value.upper())
    print(value[0])


def optional_call(callback: None) -> None:
    callback()


def bad_operations(value: int) -> None:
    value()
    print(value[0])
    print(value.missing_attribute)
    print(value + "wrong")
    for _ in value:
        pass


class Record(TypedDict):
    required: int
    optional: NotRequired[str]


def use_record(record: Record) -> None:
    print(record["missing"])
    print(record["optional"])
    record["required"] = "wrong"


class Abstract(ABC):
    @abstractmethod
    def run(self) -> None:
        pass


Abstract()
constant: Final[int] = 1
constant = 2


async def bad_await() -> None:
    await 123


@overload
def overloaded(value: int) -> int: ...
@overload
def overloaded(value: str) -> str: ...
def overloaded(value: int | str) -> int | str:
    return value


overloaded([])
pair: tuple[int, str] = (1, "two")
print(pair[3])
