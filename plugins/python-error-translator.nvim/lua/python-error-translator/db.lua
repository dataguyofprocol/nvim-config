return {
    {
        id = [=[abstractMethodInvocation]=],
        pattern = [=[Method "{method}" cannot be called because it is abstract and unimplemented]=],
        improved_message = [=[You can't call "{method}" because it has no implementation.]=],
    },
    {
        id = [=[argAssignment]=],
        pattern = [=[Argument of type "{argType}" cannot be assigned to parameter of type "{paramType}"]=],
        improved_message = [=[This argument needs to be "{paramType}", but you passed "{argType}".]=],
    },
    {
        id = [=[argAssignmentFunction]=],
        pattern = [=[Argument of type "{argType}" cannot be assigned to parameter of type "{paramType}" in function "{functionName}"]=],
        improved_message = [=["{functionName}" expects "{paramType}", but you passed "{argType}".]=],
    },
    {
        id = [=[argAssignmentParam]=],
        pattern = [=[Argument of type "{argType}" cannot be assigned to parameter "{paramName}" of type "{paramType}"]=],
        improved_message = [=["{paramName}" needs to be "{paramType}", but you passed "{argType}".]=],
    },
    {
        id = [=[argAssignmentParamFunction]=],
        pattern = [=[Argument of type "{argType}" cannot be assigned to parameter "{paramName}" of type "{paramType}" in function "{functionName}"]=],
        improved_message = [=["{functionName}" expects "{paramType}" for "{paramName}", but you passed "{argType}".]=],
    },
    {
        id = [=[argMissingForParam]=],
        pattern = [=[Argument missing for parameter {name}]=],
        improved_message = [=[You need to pass a value for {name}. To allow omitting it, give the parameter a default.]=],
    },
    {
        id = [=[argMissingForParams]=],
        pattern = [=[Arguments missing for parameters {names}]=],
        improved_message = [=[You need to pass values for {names}.]=],
    },
    {
        id = [=[argMorePositionalExpectedCount]=],
        pattern = [=[Expected {expected} more positional arguments]=],
        improved_message = [=[This call needs {expected} more positional arguments.]=],
    },
    {
        id = [=[argMorePositionalExpectedOne]=],
        pattern = [=[Expected 1 more positional argument]=],
        improved_message = [=[This call needs one more positional argument.]=],
    },
    {
        id = [=[argPositionalExpectedCount]=],
        pattern = [=[Expected {expected} positional arguments]=],
        improved_message = [=[This call expects {expected} positional arguments.]=],
    },
    {
        id = [=[argPositionalExpectedOne]=],
        pattern = [=[Expected 1 positional argument]=],
        improved_message = [=[This call expects one positional argument.]=],
    },
    {
        id = [=[argTypePartiallyUnknown]=],
        pattern = [=[Argument type is partially unknown]=],
        improved_message = [=[Part of this argument's type is unknown, so Pyright can't fully check the call.]=],
    },
    {
        id = [=[argTypeUnknown]=],
        pattern = [=[Argument type is unknown]=],
        improved_message = [=[Pyright can't tell what type this argument is, so it can't check the call.]=],
    },
    {
        id = [=[assertAlwaysTrue]=],
        pattern = [=[Assert expression always evaluates to true]=],
        improved_message = [=[Pyright considers this assertion always true, so it doesn't test a condition that could fail.]=],
    },
    {
        id = [=[assertTypeTypeMismatch]=],
        pattern = [=["assert_type" mismatch: expected "{expected}" but received "{received}"]=],
        improved_message = [=[assert_type expects "{expected}", but Pyright sees "{received}".]=],
    },
    {
        id = [=[awaitNotInAsync]=],
        pattern = [=["await" allowed only within async function]=],
        improved_message = [=[You can only use await inside an async def function.]=],
    },
    {
        id = [=[baseClassUnknown]=],
        pattern = [=[Base class type is unknown, obscuring type of derived class]=],
        improved_message = [=[Pyright doesn't know the base class's type, so it can't fully check this subclass.]=],
    },
    {
        id = [=[breakOutsideLoop]=],
        pattern = [=["break" can be used only within a loop]=],
        improved_message = [=[A break statement must be inside a loop.]=],
    },
    {
        id = [=[classDecoratorTypeUnknown]=],
        pattern = [=[Untyped class decorator obscures type of class; ignoring decorator]=],
        improved_message = [=[Pyright doesn't know this decorator's type, so it ignores the decorator when checking the class.]=],
    },
    {
        id = [=[comparisonAlwaysFalse]=],
        pattern = [=[Condition will always evaluate to False since the types "{leftType}" and "{rightType}" have no overlap]=],
        improved_message = [=[Pyright considers this condition always false because "{leftType}" and "{rightType}" have no possible values in common.]=],
    },
    {
        id = [=[comparisonAlwaysTrue]=],
        pattern = [=[Condition will always evaluate to True since the types "{leftType}" and "{rightType}" have no overlap]=],
        improved_message = [=[Pyright considers this condition always true because "{leftType}" and "{rightType}" have no possible values in common.]=],
    },
    {
        id = [=[constantRedefinition]=],
        pattern = [=["{name}" is constant (because it is uppercase) and cannot be redefined]=],
        improved_message = [=["{name}" is uppercase, so Pyright treats it as a constant. You're assigning it a new value.]=],
    },
    {
        id = [=[continueOutsideLoop]=],
        pattern = [=["continue" can be used only within a loop]=],
        improved_message = [=[A continue statement must be inside a loop.]=],
    },
    {
        id = [=[defaultValueContainsCall]=],
        pattern = [=[Function calls and mutable objects not allowed within parameter default value expression]=],
        improved_message = [=[This default contains a function call or mutable value. Python evaluates defaults once, not on each call.]=],
    },
    {
        id = [=[dictUnpackIsNotMapping]=],
        pattern = [=[Expected mapping for dictionary unpack operator]=],
        improved_message = [=[To unpack with ** in a dictionary, you need a mapping, such as another dictionary.]=],
    },
    {
        id = [=[duplicateImport]=],
        pattern = [=["{importName}" is imported more than once]=],
        improved_message = [=[You've imported "{importName}" more than once.]=],
    },
    {
        id = [=[exceptionTypeIncorrect]=],
        pattern = [=["{type}" does not derive from BaseException]=],
        improved_message = [=["{type}" isn't an exception type. Exception classes must inherit from BaseException.]=],
    },
    {
        id = [=[exceptionTypeNotClass]=],
        pattern = [=["{type}" is not a valid exception class]=],
        improved_message = [=[You can't use "{type}" as an exception class here.]=],
    },
    {
        id = [=[exceptionTypeNotInstantiable]=],
        pattern = [=[Constructor for exception type "{type}" requires one or more arguments]=],
        improved_message = [=[You need to pass arguments when creating an exception of type "{type}".]=],
    },
    {
        id = [=[expectedAssignRightHandExpr]=],
        pattern = [=[Expected expression to the right of "="]=],
        improved_message = [=[The assignment is missing a value after =.]=],
    },
    {
        id = [=[expectedBinaryRightHandExpr]=],
        pattern = [=[Expected expression to the right of operator]=],
        improved_message = [=[This operator needs a value on its right.]=],
    },
    {
        id = [=[expectedClassName]=],
        pattern = [=[Expected class name]=],
        improved_message = [=[Add a class name after class.]=],
    },
    {
        id = [=[expectedCloseBrace]=],
        pattern = [=["{" was not closed]=],
        improved_message = [=[An opening brace has no matching closing brace.]=],
    },
    {
        id = [=[expectedCloseBracket]=],
        pattern = [=["[" was not closed]=],
        improved_message = [=[An opening square bracket has no matching closing square bracket.]=],
    },
    {
        id = [=[expectedCloseParen]=],
        pattern = [=["(" was not closed]=],
        improved_message = [=[An opening parenthesis has no matching closing parenthesis.]=],
    },
    {
        id = [=[expectedColon]=],
        pattern = [=[Expected ":"]=],
        improved_message = [=[This statement needs a colon (:).]=],
    },
    {
        id = [=[expectedExceptionClass]=],
        pattern = [=[Invalid exception class or object]=],
        improved_message = [=[You need an exception class or instance here.]=],
    },
    {
        id = [=[expectedExceptionObj]=],
        pattern = [=[Expected exception object, exception class or None]=],
        improved_message = [=[An exception cause must be an exception instance, an exception class, or None.]=],
    },
    {
        id = [=[expectedExpr]=],
        pattern = [=[Expected expression]=],
        improved_message = [=[Python needs a value or expression here.]=],
    },
    {
        id = [=[expectedFunctionName]=],
        pattern = [=[Expected function name after "def"]=],
        improved_message = [=[Add a function name after def.]=],
    },
    {
        id = [=[expectedImportSymbols]=],
        pattern = [=[Expected one or more symbol names after "import"]=],
        improved_message = [=[Add one or more names after import.]=],
    },
    {
        id = [=[expectedIndentedBlock]=],
        pattern = [=[Expected indented block]=],
        improved_message = [=[This statement needs an indented body. Add its body or use pass as a placeholder.]=],
    },
    {
        id = [=[expectedMemberName]=],
        pattern = [=[Expected attribute name after "."]=],
        improved_message = [=[The dot must be followed by an attribute or method name.]=],
    },
    {
        id = [=[finalMethodOverride]=],
        pattern = [=[Method "{name}" cannot override final method defined in class "{className}"]=],
        improved_message = [=[You can't override "{name}" from "{className}" because it's marked final.]=],
    },
    {
        id = [=[finalReassigned]=],
        pattern = [=["{name}" is declared as Final and cannot be reassigned]=],
        improved_message = [=[You can't assign a new value to "{name}" because it's marked Final.]=],
    },
    {
        id = [=[finalUnassigned]=],
        pattern = [=["{name}" is declared Final, but value is not assigned]=],
        improved_message = [=["{name}" is marked Final but still needs a value.]=],
    },
    {
        id = [=[functionDecoratorTypeUnknown]=],
        pattern = [=[Untyped function decorator obscures type of function; ignoring decorator]=],
        improved_message = [=[Pyright doesn't know this decorator's type, so it ignores the decorator when checking the function.]=],
    },
    {
        id = [=[functionTypeParametersIllegal]=],
        pattern = [=[Function type parameter syntax requires Python 3.12 or newer]=],
        improved_message = [=[This generic function syntax needs Python 3.12 or newer.]=],
    },
    {
        id = [=[importCycleDetected]=],
        pattern = [=[Cycle detected in import chain]=],
        improved_message = [=[These modules import each other in a loop. The import chain is shown below.]=],
    },
    {
        id = [=[importResolveFailure]=],
        pattern = [=[Import "{importName}" could not be resolved]=],
        improved_message = [=[Pyright can't find "{importName}". Check that it's installed or on the import path in your selected Python environment.]=],
    },
    {
        id = [=[importSourceResolveFailure]=],
        pattern = [=[Import "{importName}" could not be resolved from source]=],
        improved_message = [=[Pyright found type information for "{importName}", but can't find the actual module in your Python environment.]=],
    },
    {
        id = [=[importSymbolUnknown]=],
        pattern = [=["{name}" is unknown import symbol]=],
        improved_message = [=[Pyright can't find "{name}" in the module you're importing from.]=],
    },
    {
        id = [=[incompatibleMethodOverride]=],
        pattern = [=[Method "{name}" overrides class "{className}" in an incompatible manner]=],
        improved_message = [=[Your version of "{name}" doesn't match the method in "{className}". The differences are shown below.]=],
    },
    {
        id = [=[inconsistentIndent]=],
        pattern = [=[Unindent amount does not match previous indent]=],
        improved_message = [=[This line's indentation does not match an earlier block level.]=],
    },
    {
        id = [=[inconsistentTabs]=],
        pattern = [=[Inconsistent use of tabs and spaces in indentation]=],
        improved_message = [=[This block mixes tabs and spaces in indentation. Use one consistent indentation style.]=],
    },
    {
        id = [=[initMustReturnNone]=],
        pattern = [=[Return type of "__init__" must be None]=],
        improved_message = [=[__init__ must return None, not another value.]=],
    },
    {
        id = [=[instantiateAbstract]=],
        pattern = [=[Cannot instantiate abstract class "{type}"]=],
        improved_message = [=[You can't create a "{type}" object because it still has abstract members. Implement the members listed below.]=],
    },
    {
        id = [=[instantiateProtocol]=],
        pattern = [=[Cannot instantiate Protocol class "{type}"]=],
        improved_message = [=[You can't create a "{type}" object. A Protocol describes an interface, not a class you can instantiate.]=],
    },
    {
        id = [=[listAssignmentMismatch]=],
        pattern = [=[Expression with type "{type}" cannot be assigned to target list]=],
        improved_message = [=[You can't unpack "{type}" into these variables. Check the number and types of its items.]=],
    },
    {
        id = [=[listInAnnotation]=],
        pattern = [=[List expression not allowed in type expression]=],
        improved_message = [=[Use a type such as list[int] here rather than a list value such as [int].]=],
    },
    {
        id = [=[matchIncompatible]=],
        pattern = [=[Match statements require Python 3.10 or newer]=],
        improved_message = [=[A match statement needs Python 3.10 or newer.]=],
    },
    {
        id = [=[matchIsNotExhaustive]=],
        pattern = [=[Cases within match statement do not exhaustively handle all values]=],
        improved_message = [=[This match statement doesn't cover every possible value. Add cases for the values shown below.]=],
    },
    {
        id = [=[memberAccess]=],
        pattern = [=[Cannot access attribute "{name}" for class "{type}"]=],
        improved_message = [=[You can't access "{name}" on "{type}". The reason is shown below.]=],
    },
    {
        id = [=[memberDelete]=],
        pattern = [=[Cannot delete attribute "{name}" for class "{type}"]=],
        improved_message = [=[You can't delete "{name}" on "{type}". The reason is shown below.]=],
    },
    {
        id = [=[memberSet]=],
        pattern = [=[Cannot assign to attribute "{name}" for class "{type}"]=],
        improved_message = [=[You can't assign to "{name}" on "{type}". The reason is shown below.]=],
    },
    {
        id = [=[methodNotDefined]=],
        pattern = [=["{name}" method not defined]=],
        improved_message = [=[This operation needs a "{name}" method, but this value doesn't have one.]=],
    },
    {
        id = [=[methodNotDefinedOnType]=],
        pattern = [=["{name}" method not defined on type "{type}"]=],
        improved_message = [=[This operation needs a "{name}" method, but "{type}" doesn't have one.]=],
    },
    {
        id = [=[methodOverridden]=],
        pattern = [=["{name}" overrides method of same name in class "{className}" with incompatible type "{type}"]=],
        improved_message = [=[Your version of "{name}" has type "{type}", which doesn't match the method in "{className}".]=],
    },
    {
        id = [=[missingSuperCall]=],
        pattern = [=[Method "{methodName}" does not call the method of the same name in parent class]=],
        improved_message = [=["{methodName}" replaces a parent method but doesn't call it. Check whether it needs a super() call.]=],
    },
    {
        id = [=[mixingBytesAndStr]=],
        pattern = [=[Bytes and str values cannot be concatenated]=],
        improved_message = [=[You can't join bytes and text directly. Encode the text or decode the bytes first.]=],
    },
    {
        id = [=[moduleNotCallable]=],
        pattern = [=[Module is not callable]=],
        improved_message = [=[You can't call a module like a function. Call a function or class inside it instead.]=],
    },
    {
        id = [=[moduleUnknownMember]=],
        pattern = [=["{memberName}" is not a known attribute of module "{moduleName}"]=],
        improved_message = [=[Pyright can't find "{memberName}" in module "{moduleName}".]=],
    },
    {
        id = [=[namedExceptAfterCatchAll]=],
        pattern = [=[A named except clause cannot appear after catch-all except clause]=],
        improved_message = [=[A bare except catches everything. Put specific exception handlers before it.]=],
    },
    {
        id = [=[noneNotCallable]=],
        pattern = [=[Object of type "None" cannot be called]=],
        improved_message = [=[This value may be None. Check for None before calling it.]=],
    },
    {
        id = [=[noneNotIterable]=],
        pattern = [=[Object of type "None" cannot be used as iterable value]=],
        improved_message = [=[This value may be None. Check for None before looping over it or unpacking it.]=],
    },
    {
        id = [=[noneNotSubscriptable]=],
        pattern = [=[Object of type "None" is not subscriptable]=],
        improved_message = [=[This value may be None. Check for None before using [...].]=],
    },
    {
        id = [=[noneNotUsableWith]=],
        pattern = [=[Object of type "None" cannot be used with "with"]=],
        improved_message = [=[This value may be None. Check for None before using it in a with statement.]=],
    },
    {
        id = [=[noneNotUsableWithAsync]=],
        pattern = [=[Object of type "None" cannot be used with "async with"]=],
        improved_message = [=[This value may be None. Check for None before using it in an async with statement.]=],
    },
    {
        id = [=[noneOperator]=],
        pattern = [=[Operator "{operator}" not supported for "None"]=],
        improved_message = [=[You can't use "{operator}" on None. Check for None first.]=],
    },
    {
        id = [=[noneUnknownMember]=],
        pattern = [=["{name}" is not a known attribute of "None"]=],
        improved_message = [=[This value may be None. Check for None before accessing "{name}".]=],
    },
    {
        id = [=[noOverload]=],
        pattern = [=[No overloads for "{name}" match the provided arguments]=],
        improved_message = [=[None of the overloads for "{name}" accepts these arguments. Check the allowed calls shown below.]=],
    },
    {
        id = [=[noReturnReturnsNone]=],
        pattern = [=[Function with declared return type "NoReturn" cannot return "None"]=],
        improved_message = [=[A function marked NoReturn must never finish normally, not even by returning None.]=],
    },
    {
        id = [=[objectNotCallable]=],
        pattern = [=[Object of type "{type}" is not callable]=],
        improved_message = [=[You can't call "{type}" like a function.]=],
    },
    {
        id = [=[overlappingOverload]=],
        pattern = [=[Overload {obscured} for "{name}" will never be used because its parameters overlap overload {obscuredBy}]=],
        improved_message = [=[Overload {obscuredBy} of "{name}" already covers the inputs for overload {obscured}, so overload {obscured} is never chosen.]=],
    },
    {
        id = [=[overloadImplementationMismatch]=],
        pattern = [=[Overloaded implementation is not consistent with signature of overload {index}]=],
        improved_message = [=[The function's implementation doesn't match overload {index}.]=],
    },
    {
        id = [=[overloadReturnTypeMismatch]=],
        pattern = [=[Overload {prevIndex} for "{name}" overlaps overload {newIndex} and returns an incompatible type]=],
        improved_message = [=[Overloads {prevIndex} and {newIndex} of "{name}" accept some of the same inputs but return incompatible types.]=],
    },
    {
        id = [=[overloadWithoutImplementation]=],
        pattern = [=["{name}" is marked as overload, but no implementation is provided]=],
        improved_message = [=[You've declared overloads for "{name}" but haven't written the function's implementation.]=],
    },
    {
        id = [=[paramAlreadyAssigned]=],
        pattern = [=[Parameter "{name}" is already assigned]=],
        improved_message = [=[You've passed a value for "{name}" more than once.]=],
    },
    {
        id = [=[paramAnnotationMissing]=],
        pattern = [=[Type annotation is missing for parameter "{name}"]=],
        improved_message = [=[This checking mode requires a type annotation for parameter "{name}".]=],
    },
    {
        id = [=[paramAssignmentMismatch]=],
        pattern = [=[Expression of type "{sourceType}" cannot be assigned to parameter of type "{paramType}"]=],
        improved_message = [=[This parameter expects "{paramType}", but you passed "{sourceType}".]=],
    },
    {
        id = [=[paramNameMissing]=],
        pattern = [=[No parameter named "{name}"]=],
        improved_message = [=[This function doesn't accept a keyword argument named "{name}".]=],
    },
    {
        id = [=[paramTypeCovariant]=],
        pattern = [=[Covariant type variable cannot be used in parameter type]=],
        improved_message = [=[You can't use a covariant TypeVar as a function's parameter type.]=],
    },
    {
        id = [=[paramTypePartiallyUnknown]=],
        pattern = [=[Type of parameter "{paramName}" is partially unknown]=],
        improved_message = [=[Pyright knows only part of the type of parameter "{paramName}".]=],
    },
    {
        id = [=[paramTypeUnknown]=],
        pattern = [=[Type of parameter "{paramName}" is unknown]=],
        improved_message = [=[Pyright can't tell the type of parameter "{paramName}".]=],
    },
    {
        id = [=[privateImportFromPyTypedModule]=],
        pattern = [=["{name}" is not exported from module "{module}"]=],
        improved_message = [=["{name}" isn't a public export of "{module}". Use its public import path if one exists.]=],
    },
    {
        id = [=[privateUsedOutsideOfClass]=],
        pattern = [=["{name}" is private and used outside of the class in which it is declared]=],
        improved_message = [=["{name}" is private to its class, but you're using it outside that class.]=],
    },
    {
        id = [=[privateUsedOutsideOfModule]=],
        pattern = [=["{name}" is private and used outside of the module in which it is declared]=],
        improved_message = [=["{name}" is private to its module, but you're using it outside that module.]=],
    },
    {
        id = [=[propertyOverridden]=],
        pattern = [=["{name}" incorrectly overrides property of same name in class "{className}"]=],
        improved_message = [=[Your version of "{name}" doesn't match the property in "{className}". Check the getter, setter, and types.]=],
    },
    {
        id = [=[protectedUsedOutsideOfClass]=],
        pattern = [=["{name}" is protected and used outside of the class in which it is declared]=],
        improved_message = [=["{name}" is for use inside its class or subclasses, but you're using it elsewhere.]=],
    },
    {
        id = [=[returnInAsyncGenerator]=],
        pattern = [=[Return statement with value is not allowed in async generator]=],
        improved_message = [=[An async generator can yield values, but can't return a value.]=],
    },
    {
        id = [=[returnMissing]=],
        pattern = [=[Function with declared return type "{returnType}" must return value on all code paths]=],
        improved_message = [=[This function should return "{returnType}", but it can finish without returning a value.]=],
    },
    {
        id = [=[returnOutsideFunction]=],
        pattern = [=["return" can be used only within a function]=],
        improved_message = [=[A return statement must be inside a function.]=],
    },
    {
        id = [=[returnTypeContravariant]=],
        pattern = [=[Contravariant type variable cannot be used in return type]=],
        improved_message = [=[You can't use a contravariant TypeVar as a function's return type.]=],
    },
    {
        id = [=[returnTypeMismatch]=],
        pattern = [=[Type "{exprType}" is not assignable to return type "{returnType}"]=],
        improved_message = [=[This function should return "{returnType}", but you're returning "{exprType}".]=],
    },
    {
        id = [=[returnTypePartiallyUnknown]=],
        pattern = [=[Return type, "{returnType}", is partially unknown]=],
        improved_message = [=[Part of the return type "{returnType}" is unknown, so Pyright can't fully check it.]=],
    },
    {
        id = [=[returnTypeUnknown]=],
        pattern = [=[Return type is unknown]=],
        improved_message = [=[Pyright can't tell what type this function returns.]=],
    },
    {
        id = [=[singleOverload]=],
        pattern = [=["{name}" is marked as overload, but additional overloads are missing]=],
        improved_message = [=["{name}" has only one overload. Add another or use a regular function definition.]=],
    },
    {
        id = [=[stubFileMissing]=],
        pattern = [=[Stub file not found for "{importName}"]=],
        improved_message = [=[Pyright can't find type information for "{importName}". The package may still work when you run it.]=],
    },
    {
        id = [=[symbolIsPossiblyUnbound]=],
        pattern = [=["{name}" is possibly unbound]=],
        improved_message = [=["{name}" may not have a value here. Make sure every branch assigns it before you use it.]=],
    },
    {
        id = [=[symbolIsUnbound]=],
        pattern = [=["{name}" is unbound]=],
        improved_message = [=[You're using "{name}" before assigning it a value.]=],
    },
    {
        id = [=[symbolIsUndefined]=],
        pattern = [=["{name}" is not defined]=],
        improved_message = [=[Pyright can't find a definition for "{name}". Check its spelling or define or import it first.]=],
    },
    {
        id = [=[tupleAssignmentMismatch]=],
        pattern = [=[Expression with type "{type}" cannot be assigned to target tuple]=],
        improved_message = [=[You can't unpack "{type}" into these variables. Check the number and types of its items.]=],
    },
    {
        id = [=[tupleInAnnotation]=],
        pattern = [=[Tuple expression not allowed in type expression]=],
        improved_message = [=[Use a tuple type such as tuple[int, str] here rather than a tuple value.]=],
    },
    {
        id = [=[tupleIndexOutOfRange]=],
        pattern = [=[Index {index} is out of range for type {type}]=],
        improved_message = [=[Tuple type {type} has no item at index {index}.]=],
    },
    {
        id = [=[typeAliasStatementIllegal]=],
        pattern = [=[Type alias statement requires Python 3.12 or newer]=],
        improved_message = [=[A type alias statement needs Python 3.12 or newer.]=],
    },
    {
        id = [=[typeAnnotationCall]=],
        pattern = [=[Call expression not allowed in type expression]=],
        improved_message = [=[You need a type here, not a function call.]=],
    },
    {
        id = [=[typeAnnotationVariable]=],
        pattern = [=[Variable not allowed in type expression]=],
        improved_message = [=[You're using a variable where a type is needed.]=],
    },
    {
        id = [=[typeArgsExpectingNone]=],
        pattern = [=[Expected no type arguments for class "{name}"]=],
        improved_message = [=["{name}" doesn't accept type arguments.]=],
    },
    {
        id = [=[typeArgsMismatchOne]=],
        pattern = [=[Expected one type argument but received {received}]=],
        improved_message = [=[This type needs one type argument, but you provided {received}.]=],
    },
    {
        id = [=[typeArgsMissingForAlias]=],
        pattern = [=[Expected type arguments for generic type alias "{name}"]=],
        improved_message = [=[You need to provide type arguments for alias "{name}".]=],
    },
    {
        id = [=[typeArgsMissingForClass]=],
        pattern = [=[Expected type arguments for generic class "{name}"]=],
        improved_message = [=[You need to provide type arguments for "{name}", such as the int in list[int].]=],
    },
    {
        id = [=[typeArgsTooFew]=],
        pattern = [=[Too few type arguments provided for "{name}"; expected {expected} but received {received}]=],
        improved_message = [=["{name}" needs {expected} type arguments, but you provided only {received}.]=],
    },
    {
        id = [=[typeArgsTooMany]=],
        pattern = [=[Too many type arguments provided for "{name}"; expected {expected} but received {received}]=],
        improved_message = [=["{name}" accepts {expected} type arguments, but you provided {received}.]=],
    },
    {
        id = [=[typeAssignmentMismatch]=],
        pattern = [=[Type "{sourceType}" is not assignable to declared type "{destType}"]=],
        improved_message = [=[This variable expects "{destType}", but you're assigning "{sourceType}".]=],
    },
    {
        id = [=[typeAssignmentMismatchWildcard]=],
        pattern = [=[Import symbol "{name}" has type "{sourceType}", which is not assignable to declared type "{destType}"]=],
        improved_message = [=["{name}" should be "{destType}", but the imported value is "{sourceType}".]=],
    },
    {
        id = [=[typeCallNotAllowed]=],
        pattern = [=[type() call should not be used in type expression]=],
        improved_message = [=[Use a type name here, not a type() call.]=],
    },
    {
        id = [=[typedDictAccess]=],
        pattern = [=[Could not access item in TypedDict]=],
        improved_message = [=[You can't safely read this TypedDict key. The reason is shown below.]=],
    },
    {
        id = [=[typedDictBadVar]=],
        pattern = [=[TypedDict classes can contain only type annotations]=],
        improved_message = [=[A TypedDict class only describes dictionary fields. Use type annotations, not regular assignments or methods.]=],
    },
    {
        id = [=[typedDictBaseClass]=],
        pattern = [=[All base classes for TypedDict classes must also be TypedDict classes]=],
        improved_message = [=[A TypedDict can only inherit from other TypedDict classes.]=],
    },
    {
        id = [=[typedDictDelete]=],
        pattern = [=[Could not delete item in TypedDict]=],
        improved_message = [=[You can't safely delete this TypedDict key. The reason is shown below.]=],
    },
    {
        id = [=[typedDictFieldNotRequiredRedefinition]=],
        pattern = [=[TypedDict item "{name}" cannot be redefined as NotRequired]=],
        improved_message = [=[You can't make inherited field "{name}" optional here.]=],
    },
    {
        id = [=[typedDictFieldReadOnlyRedefinition]=],
        pattern = [=[TypedDict item "{name}" cannot be redefined as ReadOnly]=],
        improved_message = [=[You can't make inherited field "{name}" read-only here.]=],
    },
    {
        id = [=[typedDictFieldRequiredRedefinition]=],
        pattern = [=[TypedDict item "{name}" cannot be redefined as Required]=],
        improved_message = [=[You can't make inherited field "{name}" required here.]=],
    },
    {
        id = [=[typedDictSet]=],
        pattern = [=[Could not assign item in TypedDict]=],
        improved_message = [=[You can't safely assign to this TypedDict key. The reason is shown below.]=],
    },
    {
        id = [=[typeNotAwaitable]=],
        pattern = [=["{type}" is not awaitable]=],
        improved_message = [=[You can't await "{type}". It isn't an awaitable value.]=],
    },
    {
        id = [=[typeNotIterable]=],
        pattern = [=["{type}" is not iterable]=],
        improved_message = [=[You can't loop over or unpack "{type}". It isn't iterable.]=],
    },
    {
        id = [=[typeNotSubscriptable]=],
        pattern = [=[Object of type "{type}" is not subscriptable]=],
        improved_message = [=[You can't use [...] on a value of type "{type}".]=],
    },
    {
        id = [=[typeNotSupportBinaryOperator]=],
        pattern = [=[Operator "{operator}" not supported for types "{leftType}" and "{rightType}"]=],
        improved_message = [=[You can't use "{operator}" with "{leftType}" and "{rightType}".]=],
    },
    {
        id = [=[typeNotSupportBinaryOperatorBidirectional]=],
        pattern = [=[Operator "{operator}" not supported for types "{leftType}" and "{rightType}" when expected type is "{expectedType}"]=],
        improved_message = [=[You can't use "{operator}" with "{leftType}" and "{rightType}" where the result needs to be "{expectedType}".]=],
    },
    {
        id = [=[typeNotSupportUnaryOperator]=],
        pattern = [=[Operator "{operator}" not supported for type "{type}"]=],
        improved_message = [=[You can't use "{operator}" on "{type}".]=],
    },
    {
        id = [=[typeNotSupportUnaryOperatorBidirectional]=],
        pattern = [=[Operator "{operator}" not supported for type "{type}" when expected type is "{expectedType}"]=],
        improved_message = [=[You can't use "{operator}" on "{type}" where the result needs to be "{expectedType}".]=],
    },
    {
        id = [=[typeNotUsableWith]=],
        pattern = [=[Object of type "{type}" cannot be used with "with" because it does not correctly implement {method}]=],
        improved_message = [=[You can't use "{type}" in a with statement. Its {method} method is missing or has the wrong type.]=],
    },
    {
        id = [=[typeNotUsableWithAsync]=],
        pattern = [=[Object of type "{type}" cannot be used with "async with" because it does not correctly implement {method}]=],
        improved_message = [=[You can't use "{type}" in an async with statement. Its {method} method is missing or has the wrong type.]=],
    },
    {
        id = [=[typePartiallyUnknown]=],
        pattern = [=[Type of "{name}" is partially unknown]=],
        improved_message = [=[Pyright knows only part of the type of "{name}".]=],
    },
    {
        id = [=[typeUnknown]=],
        pattern = [=[Type of "{name}" is unknown]=],
        improved_message = [=[Pyright can't tell what type "{name}" is.]=],
    },
    {
        id = [=[typeVarAssignedName]=],
        pattern = [=[TypeVar must be assigned to a variable named "{name}"]=],
        improved_message = [=[Assign this TypeVar to a variable named "{name}".]=],
    },
    {
        id = [=[typeVarAssignmentMismatch]=],
        pattern = [=[Type "{type}" cannot be assigned to type variable "{name}"]=],
        improved_message = [=["{type}" doesn't meet the requirements of type variable "{name}".]=],
    },
    {
        id = [=[typeVarBoundAndConstrained]=],
        pattern = [=[TypeVar cannot be both bound and constrained]=],
        improved_message = [=[A TypeVar can use bound= or a list of allowed types, but not both.]=],
    },
    {
        id = [=[typeVarNotUsedByOuterScope]=],
        pattern = [=[Type variable "{name}" has no meaning in this context]=],
        improved_message = [=[You can't use type variable "{name}" here. It isn't defined by a surrounding generic function or class.]=],
    },
    {
        id = [=[typeVarSingleConstraint]=],
        pattern = [=[TypeVar must have at least two constrained types]=],
        improved_message = [=[A TypeVar needs at least two allowed types. For a single type, use bound= instead.]=],
    },
    {
        id = [=[typeVarUsedOnlyOnce]=],
        pattern = [=[TypeVar "{name}" appears only once in generic function signature]=],
        improved_message = [=[TypeVar "{name}" appears only once, so it doesn't link any parameter or return types.]=],
    },
    {
        id = [=[typeVarVariance]=],
        pattern = [=[TypeVar cannot be both covariant and contravariant]=],
        improved_message = [=[A TypeVar can't be both covariant and contravariant.]=],
    },
    {
        id = [=[unaccessedClass]=],
        pattern = [=[Class "{name}" is not accessed]=],
        improved_message = [=[You've defined class "{name}" but never used it here.]=],
    },
    {
        id = [=[unaccessedFunction]=],
        pattern = [=[Function "{name}" is not accessed]=],
        improved_message = [=[You've defined function "{name}" but never used it here.]=],
    },
    {
        id = [=[unaccessedImport]=],
        pattern = [=[Import "{name}" is not accessed]=],
        improved_message = [=[You've imported "{name}" but never used it in this file.]=],
    },
    {
        id = [=[unaccessedSymbol]=],
        pattern = [=["{name}" is not accessed]=],
        improved_message = [=[You've defined "{name}" but never used it here.]=],
    },
    {
        id = [=[unaccessedVariable]=],
        pattern = [=[Variable "{name}" is not accessed]=],
        improved_message = [=[You've assigned a value to "{name}" but never used it.]=],
    },
    {
        id = [=[unexpectedEof]=],
        pattern = [=[Unexpected EOF]=],
        improved_message = [=[The file ends before this statement is complete.]=],
    },
    {
        id = [=[unexpectedExprToken]=],
        pattern = [=[Unexpected token at end of expression]=],
        improved_message = [=[There's an unexpected symbol or word at the end of this expression.]=],
    },
    {
        id = [=[unexpectedIndent]=],
        pattern = [=[Unexpected indentation]=],
        improved_message = [=[This line is indented, but Python doesn't expect a new block here.]=],
    },
    {
        id = [=[unexpectedUnindent]=],
        pattern = [=[Unindent not expected]=],
        improved_message = [=[This line ends a block earlier than Python expects.]=],
    },
    {
        id = [=[unhashableDictKey]=],
        pattern = [=[Dictionary key must be hashable]=],
        improved_message = [=[A dictionary key must be hashable. You can't use a regular list, dictionary, or set as a key.]=],
    },
    {
        id = [=[unhashableSetEntry]=],
        pattern = [=[Set entry must be hashable]=],
        improved_message = [=[A set item must be hashable. You can't add a regular list, dictionary, or set to a set.]=],
    },
    {
        id = [=[unnecessaryCast]=],
        pattern = [=[Unnecessary "cast" call; type is already "{type}"]=],
        improved_message = [=[This value already has type "{type}". You don't need this cast.]=],
    },
    {
        id = [=[unnecessaryPyrightIgnore]=],
        pattern = [=[Unnecessary "# pyright: ignore" comment]=],
        improved_message = [=[This # pyright: ignore comment isn't hiding any error. You can remove it.]=],
    },
    {
        id = [=[unnecessaryTypeIgnore]=],
        pattern = [=[Unnecessary "# type: ignore" comment]=],
        improved_message = [=[This # type: ignore comment isn't hiding any error. You can remove it.]=],
    },
    {
        id = [=[unpackedDictArgumentNotMapping]=],
        pattern = [=[Argument expression after ** must be a mapping with a "str" key type]=],
        improved_message = [=[After ** in a function call, pass a mapping with string keys. Those keys become keyword argument names.]=],
    },
    {
        id = [=[unusedCallResult]=],
        pattern = [=[Result of call expression is of type "{type}" and is not used; assign to variable "_" if this is intentional]=],
        improved_message = [=[This call returns "{type}", but you're ignoring the result. Assign it to _ if that's intentional.]=],
    },
    {
        id = [=[unusedCoroutine]=],
        pattern = [=[Result of async function call is not used; use "await" or assign result to variable]=],
        improved_message = [=[This async call creates a coroutine that you're ignoring. Await it or pass it to code that runs it.]=],
    },
    {
        id = [=[unusedExpression]=],
        pattern = [=[Expression value is unused]=],
        improved_message = [=[This expression produces a value, but you're not using it.]=],
    },
    {
        id = [=[yieldFromOutsideAsync]=],
        pattern = [=["yield from" not allowed in an async function]=],
        improved_message = [=[You can't use yield from inside an async function.]=],
    },
    {
        id = [=[yieldOutsideFunction]=],
        pattern = [=["yield" not allowed outside of a function or lambda]=],
        improved_message = [=[A yield expression must be inside a function or lambda.]=],
    },
}
