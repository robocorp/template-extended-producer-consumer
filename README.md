# Template: Robot Framework - Producer-Consumer Extended

Robot Framework template implementing a Producer-Consumer model using custom libraries
and resources. This combines two already existing templates, such as the
**Extended Robot Framework template** and the **Producer-consumer model template**,
into one.

It features the following:
- Producer-Consumer model: one task produces work and another consumes it.
- An optional additional third Step which reports the Consumer results.
- Item-level validation and error handling.
- Extended robot structure comprising the following:
  - Custom Python libraries placed in the [*libraries*](./libraries/) directory.
  - Custom reusable RF resources and variables file placed in
    [*resources*](./resources/).
  - Optional (setup) scripts, to be ran before the robot starts, in [*bin*](./bin/).
    (**rcc** & Control Room only)
  - Locally mocked Work Items and environment variables JSON files, to customize the
    run and simulate the Control Room behavior, in [*devdata*](./devdata/).

## Use-case

This robot template is particularly useful for complex scenarios where you need to
split bigger robots into smaller maintainable files and structure the code, resources
and any additional library or executable script accordingly.

Beside its extended modular structure, it provides the boilerplate to work with Work
Items locally, while leveraging their parallelization support and retry mechanism right
in Control Room.

## Tasks

The robot Process functionality is split into 2 mandatory Steps and an optional 3rd one
for reporting purposes (as tasks):
1. [*producer.robot*](./producer.robot): `Produce Output`
2. [*consumer.robot*](./consumer.robot): `Consume Input`
3. [*reporter.robot*](./reporter.robot): `Report Result`

Every such task has its own `<Task Name> With Trace` flavor through which you can
enable a fine grained control over the robot run and enable error tracing as well with
it. (debugging purposes)

> It is highly recommended to **rename and customize** all these tasks, including any
> other file, resource or library, as the naming used here isn't suitable for
> production. (it's just a template demo-ing the functionality)

### How to run

1. The first task runs with the only available initial input Work Item:
   **producer-input**.
2. The second task receives as input the output created by the previous (first) one.
3. The same applies for the 3rd (optional) task, where a report is generated with all
   the results obtained through the 2nd task.

Set `CREATE_REPORT` env var (in Control Room as well) if you decide to use the 3rd Step
for reporting purposes. This is enabled by default locally in the
[env.json](./devdata/env.json) file (and its other flavors when running with **rcc**).

Please go through the robot code and read the `[Documentation]` and comment sections
for each of the tasks/keywords in order to understand how the bot works in detail.

## Learn more

### Documentation

1. [Work Items](https://robocorp.com/docs/development-guide/control-room/work-items)
2. [Sharing robot code and libraries](https://robocorp.com/docs/development-guide/qa-and-best-practices/sharing-libraries)
3. [How to write and use custom Robot Framework Python RPA libraries](https://robocorp.com/docs/development-guide/robot-framework/how-to-use-custom-python-libraries-in-your-robots#quick-recap-on-robot-framework-libraries-and-keywords)

### Robot examples

- [Extended Robot Framework Template](https://robocorp.com/portal/robot/robocorp/template-extended)
- [Producer-Consumer Model Template](https://robocorp.com/portal/robot/robocorp/template-producer-consumer)
- [Web Store Order Processor Using Work Items](https://robocorp.com/portal/robot/robocorp/example-web-store-work-items)
- [Reporting Producer-Consumer model with Excel and Browser](https://robocorp.com/portal/robot/robocorp/example-producer-consumer-reporting)
- [Order in bulk the total number of requested robot parts](https://robocorp.com/portal/robot/robocorp/example-orders-distribution)
