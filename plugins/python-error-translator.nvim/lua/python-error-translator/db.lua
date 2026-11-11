return {
    {
        id = [=[abstractMethodInvocation]=],
        pattern = [=[Method "{method}" cannot be called because it is abstract and unimplemented]=],
        improved_message = [=[Abstract method "{method}" has no implementation to call here.]=],
    },
    {
        id = [=[argAssignment]=],
        pattern = [=[Argument of type "{argType}" cannot be assigned to parameter of type "{paramType}"]=],
        improved_message = [=[This argument has type "{argType}", but the parameter expects "{paramType}". Convert the value, or update the parameter annotation to accept this type.]=],
    },
    {
        id = [=[argAssignmentFunction]=],
        pattern = [=[Argument of type "{argType}" cannot be assigned to parameter of type "{paramType}" in function "{functionName}"]=],
        improved_message = [=["{functionName}" expects "{paramType}", but this argument has type "{argType}". Convert the argument, or update the parameter annotation in "{functionName}".]=],
    },
    {
        id = [=[argAssignmentParam]=],
        pattern = [=[Argument of type "{argType}" cannot be assigned to parameter "{paramName}" of type "{paramType}"]=],
        improved_message = [=[Parameter "{paramName}" expects "{paramType}", but this argument has type "{argType}". Convert the value, or update the annotation on "{paramName}".]=],
    },
    {
        id = [=[argAssignmentParamFunction]=],
        pattern = [=[Argument of type "{argType}" cannot be assigned to parameter "{paramName}" of type "{paramType}" in function "{functionName}"]=],
        improved_message = [=["{functionName}" expects "{paramType}" for "{paramName}", but this argument has type "{argType}". Convert the argument, or update the annotation of "{paramName}" in "{functionName}".]=],
    },
    {
        id = [=[argMissingForParam]=],
        pattern = [=[Argument missing for parameter {name}]=],
        improved_message = [=[The call is missing a required argument for {name}. Pass the argument, give the parameter a default, or make it Optional.]=],
    },
    {
        id = [=[argMissingForParams]=],
        pattern = [=[Arguments missing for parameters {names}]=],
        improved_message = [=[The call is missing required arguments for {names}.]=],
    },
    {
        id = [=[argMorePositionalExpectedCount]=],
        pattern = [=[Expected {expected} more positional arguments]=],
        improved_message = [=[The call needs {expected} additional positional arguments. Pass the missing arguments, or give the parameters defaults.]=],
    },
    {
        id = [=[argMorePositionalExpectedOne]=],
        pattern = [=[Expected 1 more positional argument]=],
        improved_message = [=[The call needs one additional positional argument.]=],
    },
    {
        id = [=[argPositionalExpectedCount]=],
        pattern = [=[Expected {expected} positional arguments]=],
        improved_message = [=[This call accepts {expected} positional arguments; check how many you passed.]=],
    },
    {
        id = [=[argPositionalExpectedOne]=],
        pattern = [=[Expected 1 positional argument]=],
        improved_message = [=[This call accepts one positional argument; check how many you passed.]=],
    },
    {
        id = [=[argTypePartiallyUnknown]=],
        pattern = [=[Argument type is partially unknown]=],
        improved_message = [=[Part of this argument's type is unknown, so Pyright cannot fully check the call. Annotate the missing generic arguments of this expression.]=],
    },
    {
        id = [=[argTypeUnknown]=],
        pattern = [=[Argument type is unknown]=],
        improved_message = [=[Pyright cannot determine this argument's type, so it cannot fully check the call. Annotate the expression so the call can be checked.]=],
    },
    {
        id = [=[assertAlwaysTrue]=],
        pattern = [=[Assert expression always evaluates to true]=],
        improved_message = [=[Pyright considers this assertion always true, so it does not check a condition that could fail here.]=],
    },
    {
        id = [=[assertTypeTypeMismatch]=],
        pattern = [=["assert_type" mismatch: expected "{expected}" but received "{received}"]=],
        improved_message = [=[assert_type expects the inferred type to be "{expected}", but Pyright infers "{received}".]=],
    },
    {
        id = [=[awaitNotInAsync]=],
        pattern = [=["await" allowed only within async function]=],
        improved_message = [=[Use await inside an async def function; an ordinary def function cannot await here.]=],
    },
    {
        id = [=[baseClassUnknown]=],
        pattern = [=[Base class type is unknown, obscuring type of derived class]=],
        improved_message = [=[The base class lacks type information, so Pyright cannot fully check the derived class.]=],
    },
    {
        id = [=[breakOutsideLoop]=],
        pattern = [=["break" can be used only within a loop]=],
        improved_message = [=[A break statement must be inside a loop.]=],
    },
    {
        id = [=[classDecoratorTypeUnknown]=],
        pattern = [=[Untyped class decorator obscures type of class; ignoring decorator]=],
        improved_message = [=[This decorator lacks type information, so Pyright cannot reliably determine how it changes the class's type.]=],
    },
    {
        id = [=[comparisonAlwaysFalse]=],
        pattern = [=[Condition will always evaluate to False since the types "{leftType}" and "{rightType}" have no overlap]=],
        improved_message = [=[These types, "{leftType}" and "{rightType}", do not overlap, so Pyright considers this condition always false.]=],
    },
    {
        id = [=[comparisonAlwaysTrue]=],
        pattern = [=[Condition will always evaluate to True since the types "{leftType}" and "{rightType}" have no overlap]=],
        improved_message = [=[These types, "{leftType}" and "{rightType}", do not overlap, so Pyright considers this condition always true.]=],
    },
    {
        id = [=[constantRedefinition]=],
        pattern = [=["{name}" is constant (because it is uppercase) and cannot be redefined]=],
        improved_message = [=[Pyright treats uppercase name "{name}" as a constant and flags this reassignment. Python itself does not enforce this convention.]=],
    },
    {
        id = [=[continueOutsideLoop]=],
        pattern = [=["continue" can be used only within a loop]=],
        improved_message = [=[A continue statement must be inside a loop.]=],
    },
    {
        id = [=[defaultValueContainsCall]=],
        pattern = [=[Function calls and mutable objects not allowed within parameter default value expression]=],
        improved_message = [=[This default value contains a call or mutable object. Defaults are evaluated when the function is defined, not on every call.]=],
    },
    {
        id = [=[dictUnpackIsNotMapping]=],
        pattern = [=[Expected mapping for dictionary unpack operator]=],
        improved_message = [=[After ** in a dictionary literal, pass a mapping rather than a sequence or scalar.]=],
    },
    {
        id = [=[duplicateImport]=],
        pattern = [=["{importName}" is imported more than once]=],
        improved_message = [=["{importName}" is imported more than once; one import may be redundant.]=],
    },
    {
        id = [=[exceptionTypeIncorrect]=],
        pattern = [=["{type}" does not derive from BaseException]=],
        improved_message = [=["{type}" is not derived from BaseException, so it is not an exception type.]=],
    },
    {
        id = [=[exceptionTypeNotClass]=],
        pattern = [=["{type}" is not a valid exception class]=],
        improved_message = [=["{type}" cannot be used as an exception class here.]=],
    },
    {
        id = [=[exceptionTypeNotInstantiable]=],
        pattern = [=[Constructor for exception type "{type}" requires one or more arguments]=],
        improved_message = [=[Creating exception "{type}" requires arguments. Supply them when constructing the exception.]=],
    },
    {
        id = [=[expectedAssignRightHandExpr]=],
        pattern = [=[Expected expression to the right of "="]=],
        improved_message = [=[The assignment is missing a value after =.]=],
    },
    {
        id = [=[expectedBinaryRightHandExpr]=],
        pattern = [=[Expected expression to the right of operator]=],
        improved_message = [=[This operator is missing the expression on its right-hand side.]=],
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
        improved_message = [=[This statement is missing a colon (:), usually before its indented body.]=],
    },
    {
        id = [=[expectedExceptionClass]=],
        pattern = [=[Invalid exception class or object]=],
        improved_message = [=[Use an exception class or instance here, rather than an unrelated value.]=],
    },
    {
        id = [=[expectedExceptionObj]=],
        pattern = [=[Expected exception object, exception class or None]=],
        improved_message = [=[An exception cause must be an exception instance, an exception class, or None.]=],
    },
    {
        id = [=[expectedExpr]=],
        pattern = [=[Expected expression]=],
        improved_message = [=[Python expects a value or expression here; this part of the statement is incomplete.]=],
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
        improved_message = [=["{name}" in "{className}" is marked final and must not be overridden.]=],
    },
    {
        id = [=[finalReassigned]=],
        pattern = [=["{name}" is declared as Final and cannot be reassigned]=],
        improved_message = [=["{name}" is annotated Final, so it cannot be assigned a new value.]=],
    },
    {
        id = [=[finalUnassigned]=],
        pattern = [=["{name}" is declared Final, but value is not assigned]=],
        improved_message = [=["{name}" is annotated Final but has not been given a value.]=],
    },
    {
        id = [=[functionDecoratorTypeUnknown]=],
        pattern = [=[Untyped function decorator obscures type of function; ignoring decorator]=],
        improved_message = [=[This decorator lacks type information, so Pyright cannot reliably determine how it changes the function's type.]=],
    },
    {
        id = [=[functionTypeParametersIllegal]=],
        pattern = [=[Function type parameter syntax requires Python 3.12 or newer]=],
        improved_message = [=[This generic function syntax needs Python 3.12 or newer. Check Pyright's configured Python version.]=],
    },
    {
        id = [=[importCycleDetected]=],
        pattern = [=[Cycle detected in import chain]=],
        improved_message = [=[These modules import each other in a cycle. Check the import chain shown below.]=],
    },
    {
        id = [=[importResolveFailure]=],
        pattern = [=[Import "{importName}" could not be resolved]=],
        improved_message = [=[Pyright cannot find "{importName}" in the configured Python environment or import paths. Check the interpreter, installation, and project paths. Install the package into the configured interpreter, or point Pyright at the right environment in pyrightconfig.json.]=],
    },
    {
        id = [=[importSourceResolveFailure]=],
        pattern = [=[Import "{importName}" could not be resolved from source]=],
        improved_message = [=[Pyright found type information for "{importName}", but cannot find its implementation in the configured environment. Check the interpreter and package installation. Usually safe to ignore: types come from bundled stubs. Install the package to silence it.]=],
    },
    {
        id = [=[importSymbolUnknown]=],
        pattern = [=["{name}" is unknown import symbol]=],
        improved_message = [=[Pyright cannot find an exported name "{name}" in this import. Check the name and installed package version.]=],
    },
    {
        id = [=[incompatibleMethodOverride]=],
        pattern = [=[Method "{name}" overrides class "{className}" in an incompatible manner]=],
        improved_message = [=[This override of "{name}" is incompatible with the method in "{className}". Compare the parameter and return types below.]=],
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
        improved_message = [=[__init__ initializes an existing instance; it must return None rather than another value.]=],
    },
    {
        id = [=[instantiateAbstract]=],
        pattern = [=[Cannot instantiate abstract class "{type}"]=],
        improved_message = [=["{type}" still has abstract members and cannot be instantiated. Implement the members listed below in a concrete subclass.]=],
    },
    {
        id = [=[instantiateProtocol]=],
        pattern = [=[Cannot instantiate Protocol class "{type}"]=],
        improved_message = [=["{type}" is a Protocol describing an interface, not a concrete class to instantiate.]=],
    },
    {
        id = [=[listAssignmentMismatch]=],
        pattern = [=[Expression with type "{type}" cannot be assigned to target list]=],
        improved_message = [=[This value of type "{type}" does not match the list unpacking target. Check the number and types of its items.]=],
    },
    {
        id = [=[listInAnnotation]=],
        pattern = [=[List expression not allowed in type expression]=],
        improved_message = [=[Use a type such as list[int] here rather than a list value such as [int].]=],
    },
    {
        id = [=[matchIncompatible]=],
        pattern = [=[Match statements require Python 3.10 or newer]=],
        improved_message = [=[Pattern matching needs Python 3.10 or newer. Check Pyright's configured Python version.]=],
    },
    {
        id = [=[matchIsNotExhaustive]=],
        pattern = [=[Cases within match statement do not exhaustively handle all values]=],
        improved_message = [=[This match statement leaves some possible values unhandled. Add cases for the remaining types shown below.]=],
    },
    {
        id = [=[memberAccess]=],
        pattern = [=[Cannot access attribute "{name}" for class "{type}"]=],
        improved_message = [=[Pyright cannot read attribute "{name}" on "{type}". Check its spelling, visibility, and the object's type.]=],
    },
    {
        id = [=[memberDelete]=],
        pattern = [=[Cannot delete attribute "{name}" for class "{type}"]=],
        improved_message = [=[Pyright does not allow deleting attribute "{name}" on "{type}". Check whether deletion is supported.]=],
    },
    {
        id = [=[memberSet]=],
        pattern = [=[Cannot assign to attribute "{name}" for class "{type}"]=],
        improved_message = [=[Pyright does not allow assigning to attribute "{name}" on "{type}". It may be missing, read-only, or have an incompatible type.]=],
    },
    {
        id = [=[methodNotDefined]=],
        pattern = [=["{name}" method not defined]=],
        improved_message = [=[This operation requires the method "{name}", but it is not defined on this value.]=],
    },
    {
        id = [=[methodNotDefinedOnType]=],
        pattern = [=["{name}" method not defined on type "{type}"]=],
        improved_message = [=[This operation requires the method "{name}", but type "{type}" does not implement it.]=],
    },
    {
        id = [=[methodOverridden]=],
        pattern = [=["{name}" overrides method of same name in class "{className}" with incompatible type "{type}"]=],
        improved_message = [=[Override "{name}" in "{className}" has incompatible type "{type}". Check the base method's signature.]=],
    },
    {
        id = [=[missingSuperCall]=],
        pattern = [=[Method "{methodName}" does not call the method of the same name in parent class]=],
        improved_message = [=["{methodName}" overrides a parent method without calling it. Check whether the parent's initialization or behavior is required.]=],
    },
    {
        id = [=[mixingBytesAndStr]=],
        pattern = [=[Bytes and str values cannot be concatenated]=],
        improved_message = [=[Bytes and text cannot be concatenated directly. Encode text to bytes or decode bytes to text using the appropriate encoding.]=],
    },
    {
        id = [=[moduleNotCallable]=],
        pattern = [=[Module is not callable]=],
        improved_message = [=[A module cannot be called with (...). Call the function or class inside the module instead.]=],
    },
    {
        id = [=[moduleUnknownMember]=],
        pattern = [=["{memberName}" is not a known attribute of module "{moduleName}"]=],
        improved_message = [=[Module "{moduleName}" has no known attribute "{memberName}". Check the spelling, exports, and package version.]=],
    },
    {
        id = [=[namedExceptAfterCatchAll]=],
        pattern = [=[A named except clause cannot appear after catch-all except clause]=],
        improved_message = [=[A bare except catches everything, so specific except handlers must come before it.]=],
    },
    {
        id = [=[noneNotCallable]=],
        pattern = [=[Object of type "None" cannot be called]=],
        improved_message = [=[This value may be None rather than a callable. Check for None before calling it. Guard with "if value is not None" before calling it.]=],
    },
    {
        id = [=[noneNotIterable]=],
        pattern = [=[Object of type "None" cannot be used as iterable value]=],
        improved_message = [=[This value may be None rather than an iterable. Check for None before looping or unpacking. Guard against None before the loop, or iterate "value or ()".]=],
    },
    {
        id = [=[noneNotSubscriptable]=],
        pattern = [=[Object of type "None" is not subscriptable]=],
        improved_message = [=[This value may be None, so indexing it with [...] is unsafe. Check for None before indexing. Guard with "if value is not None" before indexing.]=],
    },
    {
        id = [=[noneNotUsableWith]=],
        pattern = [=[Object of type "None" cannot be used with "with"]=],
        improved_message = [=[This value may be None, which cannot be used as a context manager. Check for None before the with statement.]=],
    },
    {
        id = [=[noneNotUsableWithAsync]=],
        pattern = [=[Object of type "None" cannot be used with "async with"]=],
        improved_message = [=[This value may be None, which cannot be used as an async context manager. Check for None before async with.]=],
    },
    {
        id = [=[noneOperator]=],
        pattern = [=[Operator "{operator}" not supported for "None"]=],
        improved_message = [=[The operator "{operator}" cannot be applied to None here. Check for None before this operation. Guard against None before using the operator.]=],
    },
    {
        id = [=[noneUnknownMember]=],
        pattern = [=["{name}" is not a known attribute of "None"]=],
        improved_message = [=[This value may be None, which has no attribute "{name}". Check for None before accessing it. Guard with "if value is not None" before touching attributes.]=],
    },
    {
        id = [=[noOverload]=],
        pattern = [=[No overloads for "{name}" match the provided arguments]=],
        improved_message = [=[None of the declared call signatures for "{name}" accepts these arguments. Check their types and names.]=],
    },
    {
        id = [=[noReturnReturnsNone]=],
        pattern = [=[Function with declared return type "NoReturn" cannot return "None"]=],
        improved_message = [=[A function annotated NoReturn must not return normally, including returning None.]=],
    },
    {
        id = [=[objectNotCallable]=],
        pattern = [=[Object of type "{type}" is not callable]=],
        improved_message = [=[A value of type "{type}" cannot be called with (...). Check whether you meant a function or method. Check for a missing "()" on an earlier line, or that the value really is callable.]=],
    },
    {
        id = [=[overlappingOverload]=],
        pattern = [=[Overload {obscured} for "{name}" will never be used because its parameters overlap overload {obscuredBy}]=],
        improved_message = [=[Overload {obscured} of "{name}" is shadowed by earlier overload {obscuredBy}, so it will never be selected.]=],
    },
    {
        id = [=[overloadImplementationMismatch]=],
        pattern = [=[Overloaded implementation is not consistent with signature of overload {index}]=],
        improved_message = [=[The runtime implementation does not support everything promised by overload {index}.]=],
    },
    {
        id = [=[overloadReturnTypeMismatch]=],
        pattern = [=[Overload {prevIndex} for "{name}" overlaps overload {newIndex} and returns an incompatible type]=],
        improved_message = [=[Overloads {prevIndex} and {newIndex} of "{name}" accept overlapping inputs but promise incompatible return types.]=],
    },
    {
        id = [=[overloadWithoutImplementation]=],
        pattern = [=["{name}" is marked as overload, but no implementation is provided]=],
        improved_message = [=["{name}" has an @overload signature but no runtime implementation in this Python file.]=],
    },
    {
        id = [=[paramAlreadyAssigned]=],
        pattern = [=[Parameter "{name}" is already assigned]=],
        improved_message = [=["{name}" receives more than one argument, for example both a positional and a keyword argument.]=],
    },
    {
        id = [=[paramAnnotationMissing]=],
        pattern = [=[Type annotation is missing for parameter "{name}"]=],
        improved_message = [=[Parameter "{name}" needs a type annotation for this checking mode.]=],
    },
    {
        id = [=[paramAssignmentMismatch]=],
        pattern = [=[Expression of type "{sourceType}" cannot be assigned to parameter of type "{paramType}"]=],
        improved_message = [=[This parameter expects "{paramType}", but the supplied expression has type "{sourceType}".]=],
    },
    {
        id = [=[paramNameMissing]=],
        pattern = [=[No parameter named "{name}"]=],
        improved_message = [=[This function has no parameter named "{name}". Check the keyword spelling and function signature.]=],
    },
    {
        id = [=[paramTypeCovariant]=],
        pattern = [=[Covariant type variable cannot be used in parameter type]=],
        improved_message = [=[A covariant TypeVar cannot be used as this input parameter type.]=],
    },
    {
        id = [=[paramTypePartiallyUnknown]=],
        pattern = [=[Type of parameter "{paramName}" is partially unknown]=],
        improved_message = [=[Part of parameter "{paramName}"'s type is unknown. Check generic arguments and upstream type information. Annotate the missing generic arguments of "{paramName}".]=],
    },
    {
        id = [=[paramTypeUnknown]=],
        pattern = [=[Type of parameter "{paramName}" is unknown]=],
        improved_message = [=[Pyright cannot determine the type of parameter "{paramName}". Add an annotation or check upstream type information. Add an annotation for "{paramName}".]=],
    },
    {
        id = [=[privateImportFromPyTypedModule]=],
        pattern = [=["{name}" is not exported from module "{module}"]=],
        improved_message = [=[Module "{module}" does not declare "{name}" as a public export. Use its public import path if one exists.]=],
    },
    {
        id = [=[privateUsedOutsideOfClass]=],
        pattern = [=["{name}" is private and used outside of the class in which it is declared]=],
        improved_message = [=["{name}" is intended to be private to its declaring class, but is accessed outside it.]=],
    },
    {
        id = [=[privateUsedOutsideOfModule]=],
        pattern = [=["{name}" is private and used outside of the module in which it is declared]=],
        improved_message = [=["{name}" is intended to be private to its declaring module, but is accessed outside it.]=],
    },
    {
        id = [=[propertyOverridden]=],
        pattern = [=["{name}" incorrectly overrides property of same name in class "{className}"]=],
        improved_message = [=["{name}" does not correctly override the property in "{className}". Check the getter, setter, and types.]=],
    },
    {
        id = [=[protectedUsedOutsideOfClass]=],
        pattern = [=["{name}" is protected and used outside of the class in which it is declared]=],
        improved_message = [=["{name}" is intended for use inside its class or subclasses, but is accessed elsewhere.]=],
    },
    {
        id = [=[returnInAsyncGenerator]=],
        pattern = [=[Return statement with value is not allowed in async generator]=],
        improved_message = [=[An async generator can yield values, but cannot return a value.]=],
    },
    {
        id = [=[returnMissing]=],
        pattern = [=[Function with declared return type "{returnType}" must return value on all code paths]=],
        improved_message = [=[This function promises to return "{returnType}", but at least one code path finishes without returning a value. Return a value on every code path, or widen the declared return type.]=],
    },
    {
        id = [=[returnOutsideFunction]=],
        pattern = [=["return" can be used only within a function]=],
        improved_message = [=[A return statement must be inside a function.]=],
    },
    {
        id = [=[returnTypeContravariant]=],
        pattern = [=[Contravariant type variable cannot be used in return type]=],
        improved_message = [=[A contravariant TypeVar cannot be used as this return type.]=],
    },
    {
        id = [=[returnTypeMismatch]=],
        pattern = [=[Type "{exprType}" is not assignable to return type "{returnType}"]=],
        improved_message = [=[This function promises to return "{returnType}", but this return value has type "{exprType}". Return a value of the declared type, or fix the return annotation.]=],
    },
    {
        id = [=[returnTypePartiallyUnknown]=],
        pattern = [=[Return type, "{returnType}", is partially unknown]=],
        improved_message = [=[Part of return type "{returnType}" is unknown. Check generic arguments and returned values. Annotate the missing generic arguments of the return type.]=],
    },
    {
        id = [=[returnTypeUnknown]=],
        pattern = [=[Return type is unknown]=],
        improved_message = [=[Pyright cannot determine this function's return type. Check its annotation and returned values. Add a return annotation to this function.]=],
    },
    {
        id = [=[singleOverload]=],
        pattern = [=["{name}" is marked as overload, but additional overloads are missing]=],
        improved_message = [=["{name}" has only one @overload signature. Declare alternatives or use an ordinary function signature.]=],
    },
    {
        id = [=[stubFileMissing]=],
        pattern = [=[Stub file not found for "{importName}"]=],
        improved_message = [=[Pyright cannot find a type stub for "{importName}". The package may work at runtime but lack type information. Install stubs with pip install types-{importName}, or keep going without them.]=],
    },
    {
        id = [=[symbolIsPossiblyUnbound]=],
        pattern = [=["{name}" is possibly unbound]=],
        improved_message = [=[Some code paths reach this use of "{name}" without assigning it a value. Assign a value in every branch, or initialize the variable before the conditional.]=],
    },
    {
        id = [=[symbolIsUnbound]=],
        pattern = [=["{name}" is unbound]=],
        improved_message = [=["{name}" is used before it has a value in this scope.]=],
    },
    {
        id = [=[symbolIsUndefined]=],
        pattern = [=["{name}" is not defined]=],
        improved_message = [=[Python cannot find a definition of "{name}" in this scope. Check its spelling, definition, or import.]=],
    },
    {
        id = [=[tupleAssignmentMismatch]=],
        pattern = [=[Expression with type "{type}" cannot be assigned to target tuple]=],
        improved_message = [=[This value of type "{type}" does not match the tuple unpacking target. Check the number and types of its items.]=],
    },
    {
        id = [=[tupleInAnnotation]=],
        pattern = [=[Tuple expression not allowed in type expression]=],
        improved_message = [=[Use a tuple type such as tuple[int, str] here rather than a tuple value.]=],
    },
    {
        id = [=[tupleIndexOutOfRange]=],
        pattern = [=[Index {index} is out of range for type {type}]=],
        improved_message = [=[Index {index} is outside the known bounds of tuple type {type}.]=],
    },
    {
        id = [=[typeAliasStatementIllegal]=],
        pattern = [=[Type alias statement requires Python 3.12 or newer]=],
        improved_message = [=[The type alias statement needs Python 3.12 or newer. Check Pyright's configured Python version.]=],
    },
    {
        id = [=[typeAnnotationCall]=],
        pattern = [=[Call expression not allowed in type expression]=],
        improved_message = [=[A type annotation needs a type expression, not a function call.]=],
    },
    {
        id = [=[typeAnnotationVariable]=],
        pattern = [=[Variable not allowed in type expression]=],
        improved_message = [=[This annotation uses a value where Pyright expects a type.]=],
    },
    {
        id = [=[typeArgsExpectingNone]=],
        pattern = [=[Expected no type arguments for class "{name}"]=],
        improved_message = [=[Class "{name}" is not generic here and accepts no type arguments.]=],
    },
    {
        id = [=[typeArgsMismatchOne]=],
        pattern = [=[Expected one type argument but received {received}]=],
        improved_message = [=[This type expects one type argument, but {received} were supplied.]=],
    },
    {
        id = [=[typeArgsMissingForAlias]=],
        pattern = [=[Expected type arguments for generic type alias "{name}"]=],
        improved_message = [=[Generic alias "{name}" needs type arguments.]=],
    },
    {
        id = [=[typeArgsMissingForClass]=],
        pattern = [=[Expected type arguments for generic class "{name}"]=],
        improved_message = [=[Generic class "{name}" needs type arguments to describe the types it contains or uses.]=],
    },
    {
        id = [=[typeArgsTooFew]=],
        pattern = [=[Too few type arguments provided for "{name}"; expected {expected} but received {received}]=],
        improved_message = [=["{name}" expects {expected} type arguments, but only {received} were supplied.]=],
    },
    {
        id = [=[typeArgsTooMany]=],
        pattern = [=[Too many type arguments provided for "{name}"; expected {expected} but received {received}]=],
        improved_message = [=["{name}" expects {expected} type arguments, but {received} were supplied.]=],
    },
    {
        id = [=[typeAssignmentMismatch]=],
        pattern = [=[Type "{sourceType}" is not assignable to declared type "{destType}"]=],
        improved_message = [=[This value has type "{sourceType}", but the declared type is "{destType}". Update the declaration to match the value, or convert the value.]=],
    },
    {
        id = [=[typeAssignmentMismatchWildcard]=],
        pattern = [=[Import symbol "{name}" has type "{sourceType}", which is not assignable to declared type "{destType}"]=],
        improved_message = [=[The imported name "{name}" has type "{sourceType}", but its declaration expects "{destType}".]=],
    },
    {
        id = [=[typeCallNotAllowed]=],
        pattern = [=[type() call should not be used in type expression]=],
        improved_message = [=[Use a type name in this annotation rather than calling type() on a value.]=],
    },
    {
        id = [=[typedDictAccess]=],
        pattern = [=[Could not access item in TypedDict]=],
        improved_message = [=[This TypedDict lookup is not type-safe. The details below explain whether the key is missing, optional, or invalid.]=],
    },
    {
        id = [=[typedDictBadVar]=],
        pattern = [=[TypedDict classes can contain only type annotations]=],
        improved_message = [=[A TypedDict class describes dictionary fields with type annotations; it cannot contain ordinary class statements here.]=],
    },
    {
        id = [=[typedDictBaseClass]=],
        pattern = [=[All base classes for TypedDict classes must also be TypedDict classes]=],
        improved_message = [=[A TypedDict can inherit only from other TypedDict classes.]=],
    },
    {
        id = [=[typedDictDelete]=],
        pattern = [=[Could not delete item in TypedDict]=],
        improved_message = [=[This TypedDict key cannot safely be deleted. Check whether it is required or read-only.]=],
    },
    {
        id = [=[typedDictFieldNotRequiredRedefinition]=],
        pattern = [=[TypedDict item "{name}" cannot be redefined as NotRequired]=],
        improved_message = [=[Inherited field "{name}" cannot be changed to NotRequired here.]=],
    },
    {
        id = [=[typedDictFieldReadOnlyRedefinition]=],
        pattern = [=[TypedDict item "{name}" cannot be redefined as ReadOnly]=],
        improved_message = [=[Inherited field "{name}" cannot be changed to ReadOnly here.]=],
    },
    {
        id = [=[typedDictFieldRequiredRedefinition]=],
        pattern = [=[TypedDict item "{name}" cannot be redefined as Required]=],
        improved_message = [=[Inherited field "{name}" cannot be changed to Required here.]=],
    },
    {
        id = [=[typedDictSet]=],
        pattern = [=[Could not assign item in TypedDict]=],
        improved_message = [=[This TypedDict assignment is not type-safe. Check the key, value type, and read-only restrictions below.]=],
    },
    {
        id = [=[typeNotAwaitable]=],
        pattern = [=["{type}" is not awaitable]=],
        improved_message = [=[A value of type "{type}" cannot be awaited. Check whether this call actually returns an awaitable.]=],
    },
    {
        id = [=[typeNotIterable]=],
        pattern = [=["{type}" is not iterable]=],
        improved_message = [=[A value of type "{type}" cannot be iterated over here. Check what you are looping over or unpacking.]=],
    },
    {
        id = [=[typeNotSubscriptable]=],
        pattern = [=[Object of type "{type}" is not subscriptable]=],
        improved_message = [=[A value of type "{type}" does not support indexing with [...]. Check the value's type.]=],
    },
    {
        id = [=[typeNotSupportBinaryOperator]=],
        pattern = [=[Operator "{operator}" not supported for types "{leftType}" and "{rightType}"]=],
        improved_message = [=[The operator "{operator}" cannot combine "{leftType}" and "{rightType}" here. Convert one side so both operands share a type the operator supports.]=],
    },
    {
        id = [=[typeNotSupportBinaryOperatorBidirectional]=],
        pattern = [=[Operator "{operator}" not supported for types "{leftType}" and "{rightType}" when expected type is "{expectedType}"]=],
        improved_message = [=[The operator "{operator}" cannot combine "{leftType}" and "{rightType}" with the expected result type "{expectedType}".]=],
    },
    {
        id = [=[typeNotSupportUnaryOperator]=],
        pattern = [=[Operator "{operator}" not supported for type "{type}"]=],
        improved_message = [=[The operator "{operator}" cannot be applied to "{type}" here.]=],
    },
    {
        id = [=[typeNotSupportUnaryOperatorBidirectional]=],
        pattern = [=[Operator "{operator}" not supported for type "{type}" when expected type is "{expectedType}"]=],
        improved_message = [=[The operator "{operator}" cannot be applied to "{type}" with the expected result type "{expectedType}".]=],
    },
    {
        id = [=[typeNotUsableWith]=],
        pattern = [=[Object of type "{type}" cannot be used with "with" because it does not correctly implement {method}]=],
        improved_message = [=["{type}" cannot be used in a with statement because its {method} method is missing or incompatible.]=],
    },
    {
        id = [=[typeNotUsableWithAsync]=],
        pattern = [=[Object of type "{type}" cannot be used with "async with" because it does not correctly implement {method}]=],
        improved_message = [=["{type}" cannot be used in async with because its {method} method is missing or incompatible.]=],
    },
    {
        id = [=[typePartiallyUnknown]=],
        pattern = [=[Type of "{name}" is partially unknown]=],
        improved_message = [=[Part of "{name}"'s type is unknown. Check missing generic arguments and upstream type information. Annotate the missing generic arguments of "{name}".]=],
    },
    {
        id = [=[typeUnknown]=],
        pattern = [=[Type of "{name}" is unknown]=],
        improved_message = [=[Pyright cannot determine the type of "{name}". Check annotations and the source of this value. Add an annotation where the value is created.]=],
    },
    {
        id = [=[typeVarAssignedName]=],
        pattern = [=[TypeVar must be assigned to a variable named "{name}"]=],
        improved_message = [=[The variable holding this TypeVar must be named "{name}", matching the TypeVar's declared name.]=],
    },
    {
        id = [=[typeVarAssignmentMismatch]=],
        pattern = [=[Type "{type}" cannot be assigned to type variable "{name}"]=],
        improved_message = [=[Type "{type}" does not satisfy the requirements of type variable "{name}".]=],
    },
    {
        id = [=[typeVarBoundAndConstrained]=],
        pattern = [=[TypeVar cannot be both bound and constrained]=],
        improved_message = [=[A TypeVar can have a bound or a list of constraints, but not both.]=],
    },
    {
        id = [=[typeVarNotUsedByOuterScope]=],
        pattern = [=[Type variable "{name}" has no meaning in this context]=],
        improved_message = [=[Type variable "{name}" is not bound by an enclosing generic function or class in this context.]=],
    },
    {
        id = [=[typeVarSingleConstraint]=],
        pattern = [=[TypeVar must have at least two constrained types]=],
        improved_message = [=[A constrained TypeVar needs at least two alternative types. For one upper limit, use bound= instead.]=],
    },
    {
        id = [=[typeVarUsedOnlyOnce]=],
        pattern = [=[TypeVar "{name}" appears only once in generic function signature]=],
        improved_message = [=[TypeVar "{name}" appears only once in this function signature, so it does not relate multiple input or output types.]=],
    },
    {
        id = [=[typeVarVariance]=],
        pattern = [=[TypeVar cannot be both covariant and contravariant]=],
        improved_message = [=[A TypeVar cannot be both covariant and contravariant.]=],
    },
    {
        id = [=[unaccessedClass]=],
        pattern = [=[Class "{name}" is not accessed]=],
        improved_message = [=[Class "{name}" is not used in this scope. Check whether it is needed or intended as a public entry point.]=],
    },
    {
        id = [=[unaccessedFunction]=],
        pattern = [=[Function "{name}" is not accessed]=],
        improved_message = [=[Function "{name}" is not used in this scope. Check whether it is needed or intended as a public entry point.]=],
    },
    {
        id = [=[unaccessedImport]=],
        pattern = [=[Import "{name}" is not accessed]=],
        improved_message = [=[Import "{name}" is not used in this file. Remove it if it is not needed for exports or side effects. Remove the import, or re-export it deliberately via __all__.]=],
    },
    {
        id = [=[unaccessedSymbol]=],
        pattern = [=["{name}" is not accessed]=],
        improved_message = [=["{name}" is not used in this scope. Check whether it is needed for exports or side effects.]=],
    },
    {
        id = [=[unaccessedVariable]=],
        pattern = [=[Variable "{name}" is not accessed]=],
        improved_message = [=[Variable "{name}" is assigned but never read in this scope. Use the variable, drop it, or prefix its name with underscore.]=],
    },
    {
        id = [=[unexpectedEof]=],
        pattern = [=[Unexpected EOF]=],
        improved_message = [=[The file ends before this statement is complete. Check missing brackets, quotes, or a required body.]=],
    },
    {
        id = [=[unexpectedExprToken]=],
        pattern = [=[Unexpected token at end of expression]=],
        improved_message = [=[This expression has an unexpected token at its end. Check for an extra symbol or missing separator.]=],
    },
    {
        id = [=[unexpectedIndent]=],
        pattern = [=[Unexpected indentation]=],
        improved_message = [=[This line is indented where Python does not expect a new block.]=],
    },
    {
        id = [=[unexpectedUnindent]=],
        pattern = [=[Unindent not expected]=],
        improved_message = [=[This line leaves an indentation level where Python does not expect it.]=],
    },
    {
        id = [=[unhashableDictKey]=],
        pattern = [=[Dictionary key must be hashable]=],
        improved_message = [=[Dictionary keys must be hashable. Mutable lists, dictionaries, and sets cannot normally be used as keys.]=],
    },
    {
        id = [=[unhashableSetEntry]=],
        pattern = [=[Set entry must be hashable]=],
        improved_message = [=[Set elements must be hashable. Mutable lists, dictionaries, and sets cannot normally be stored in a set.]=],
    },
    {
        id = [=[unnecessaryCast]=],
        pattern = [=[Unnecessary "cast" call; type is already "{type}"]=],
        improved_message = [=[This value already has type "{type}", so this cast does not add type information.]=],
    },
    {
        id = [=[unnecessaryPyrightIgnore]=],
        pattern = [=[Unnecessary "# pyright: ignore" comment]=],
        improved_message = [=[This line has no diagnostic needing # pyright: ignore; the suppression can be removed.]=],
    },
    {
        id = [=[unnecessaryTypeIgnore]=],
        pattern = [=[Unnecessary "# type: ignore" comment]=],
        improved_message = [=[This line has no diagnostic needing # type: ignore; the suppression can be removed.]=],
    },
    {
        id = [=[unpackedDictArgumentNotMapping]=],
        pattern = [=[Argument expression after ** must be a mapping with a "str" key type]=],
        improved_message = [=[After **, pass a mapping whose keys are strings, so Python can use them as keyword argument names.]=],
    },
    {
        id = [=[unusedCallResult]=],
        pattern = [=[Result of call expression is of type "{type}" and is not used; assign to variable "_" if this is intentional]=],
        improved_message = [=[This call returns "{type}", but the result is unused. Use it or assign it to _ if discarding it is intentional.]=],
    },
    {
        id = [=[unusedCoroutine]=],
        pattern = [=[Result of async function call is not used; use "await" or assign result to variable]=],
        improved_message = [=[This async call creates a coroutine but its result is unused. Await it or pass it to code that runs it.]=],
    },
    {
        id = [=[unusedExpression]=],
        pattern = [=[Expression value is unused]=],
        improved_message = [=[This expression computes a value but does not use it. Check whether you meant to assign or return it.]=],
    },
    {
        id = [=[yieldFromOutsideAsync]=],
        pattern = [=["yield from" not allowed in an async function]=],
        improved_message = [=[An async function cannot use yield from. Use async iteration where appropriate.]=],
    },
    {
        id = [=[yieldOutsideFunction]=],
        pattern = [=["yield" not allowed outside of a function or lambda]=],
        improved_message = [=[A yield expression must be inside a function or lambda.]=],
    },
}
