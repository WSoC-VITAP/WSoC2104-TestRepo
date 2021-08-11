# WSoC2104(SOUL)-TestRepo (Tech Stack: Android)
Test repository for WSoC2104 - SOUL

## Project Description

- This project aims to create a mobile application to improve the mental health of the user
  by asking them 20 questions and guessing their current mental health and providing
  them solutions or suggestions to make them happy if the current mental state of the
  user is depressed or stressed.

## Technology Stack

- The Frontend for the project will be based on Java and Flutter.
- The Middle Layer interacting with the entire project will be based on Machine Learning
  and Artificial Intelligence.
- The Back end of the project will utilize MySQL as the database.

## Project Scope
- The issues with the current applications are they don’t exactly find your mental state but
  they just track your mood and ask your questions to check your mental health state and
  provide you with minimal suggestions to make you feel better.

- Just tracking the moods of the user and providing them with some exercises won’t help
  the user who is suffering from severe depression and stress. The existing apps aren’t
  much of help because of the old data set they have and they don’t provide you with
  proper solutions and which in turn shows the inability of the apps available as of now.
  
- So centralizing all the features like mood tracking, daily check up of mental etc of the
  existing apps and adding a proper ML model feature to detect the mental health of the
  user and to help them out in a single app is the solution to this.

- We could use the login feature too so that they can keep track of their mental health and
  they can see their data etc. We could use this data in the future for the development of
  the ML model in the application and make the model more accurate.

## Creating the test workspace

To participate and solve different tasks to let us know that you have skills enough to help us with this project, you
need to execute the following commands to set up the perfect local workspace. Before you being with the setup, it is to
be noted that you need to install [git-cli](https://git-scm.com/downloads) tool.

### Cloning the existing test project from GitHub

```shell
    $> git clone https://github.com/WSoC-VITAP/WSoC2104-TestRepo.git
```

The above command will clone or download all the files from various snapshots into the current directory from where you
run this command. This should be enough for cloning but if you want to know more about git cloning then
checkout [git cloning documentation](https://github.com/git-guides/git-clone).

### Creating a new branch

Git lets you create branches and work on different branches with different versions of the same project. We want you to
create a branch so that we can recognize your work and distinguish it from other submissions.

```shell
    Command:
      $> git checkout -b <yourname_reg>
    Example:
      $> git checkout -b abc_20bce0123
```

The above command will create a new branch, and you will be automatically switched to that branch. So whatever changes
you make will be saved to the newly made branch on every commit. Now, you can start working on the given tasks.
Refer the following section on how to run the server and get started with solving this test tasks by completing the most of
them.
