#import "proposal.typ": *

#set text(lang: "en")

#show: proposal.with(
  title: [CI Optimization for R Package Performance Testing],
  author: "Sagnik Mandal",
  // abstract: [],
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false),
  table-of-contents: none,
  date: datetime(year: 2025, month: 01, day: 25),
  version: "v1.0",
)

#outline()

= Project Info
*Project title:* Optimizing a performance testing workflow by reusing minified R package versions between CI runs

*Short Title:* CI Optimization for R Package Performance Testing

*Idea Page:* #link("https://github.com/rstats-gsoc/gsoc2025/wiki/Optimizing-a-performance-testing-workflow-by-reusing-minified-R-package-versions-between-CI-runs")[Idea Description on the R GSoC Wiki]

= Bio

I am Sagnik Mandal, a sophomore pursuing an Integrated Dual Degree in Materials Science and Technology at IIT (BHU), Varanasi. I have been a self-taught programmer since over 6 years now, and have also contributed to various open source projects, and used to maintain a couple of packages on the Arch Linux User Repository (AUR).

I first learnt about R, when I was following a online course on #link("https://onlinecourses.nptel.ac.in/noc20_mm11/preview")["Dealing with materials data : collection, analysis and interpretation"], this course discussed data analysis using R for materials science. I have also been working under a professor at my institute on a project that involves data analysis and machine learning for material science applications.

I have used Github Actions in some of my personal projects, last year I #link("https://gist.github.com/criticic/4b8ac935a75e417d9b13c6d65174ce03")[applied to Joplin for GSoC] to work on a similar project where I had planned to use Github Actions to automatically fetch build Joplin Plugins, along with preventing malicious code from being executed. While the project was shortlisted by Joplin, I couldn't make it to the final list of selected students, but this experience has helped me understand the working of Github Actions.

Other information about me can be found on my #link("https://iitbhuacin-my.sharepoint.com/:f:/g/personal/sagnik_mandal_mst23_iitbhu_ac_in/Eo37-GZPeGZEgffFS2u6o0sBCbUYV3_HH7SpUVq3pKw0cA?e=BiQheS")[resume].

#pagebreak()


= Contact Information
*Name:* Sagnik Mandal

*Postal Address:* 503, Satish Dhawan Hostel, IIT (BHU), Varanasi, Uttar Pradesh, India, 221005 (#link("https://time.is/UTC+5.5")[Timezone: UTC+5.5])

*Telephone(s):* #link("tel:+91-7470989815")[+91-7470989815]

*Email(s):* #link("mailto:sagnik.mandal.mst23@iitbhu.ac.in")[#"sagnik.mandal.mst23@iitbhu.ac.in"], #link("mailto:acriticalcynic@outlook.com")[#"acriticalcynic@outlook.com"]

*Other communications channels:* Google Meet, #link("https://us04web.zoom.us/launch/chat?src=direct_chat_link&email=sagnik.mandal.mst23%40itbhu.ac.in")[Zoom], #link("https://discordapp.com/users/883970959864889405")[Discord], #link("https://wa.me/917470989815")[WhatsApp]

= Affiliation
*Institution:* Indian Institute of Technology (Banaras Hindu University), Varanasi, India

*Program:* B.Tech. & M.Tech. (Integrated Dual Degree) in Materials Science and Technology

*Stage of Completion:* Sophomore, expected graduation in 2028

*Contact to Verify:* #link("https://www.iitbhu.ac.in/dept/mst/people/cupadhyaymst")[Dr. Chandan Upadhyay] (_email: #link("mailto:cupadhyay.mst@iitbhu.ac.in")[#"cupadhyay.mst@iitbhu.ac.in"]_)

= Schedule Conflicts
I have my End Semester Examinations from Apr 24 – May 09, 2025, and will most probably be travelling back home within a week after that. This will clash with the first week of the Community Bonding period, but I will be able to work on the project during the rest of the summer without any interruptions. I have already setup my build environment and through the tests I have also tackled parts of the project.

My next semester starts on July 11, 2025, and considering a 175 hour coding period, I will ensure the project is completed before that.

= Mentors
*Evaluating Mentor:* Anirban Chetia (anirban166) (_email: #link("mailto:ac4743@nau.edu")[#"ac4743@nau.edu"]_)

*Co-Mentor(s)*: Toby Dylan Hocking (tdhock) (_email: #link("mailto:toby.hocking@r-project.org")[#"toby.hocking@r-project.org"]_)

*Contact with Mentors:* I have been in touch with both Anirban and Toby over email.

= Coding Plan and Methods

TODO

= Timeline

// May 8 - June 1
// Community Bonding Period | GSoC contributors get to know mentors, read documentation, get up to speed to begin working on their projects
// June 2
// Coding officially begins!
// July 14 - 18:00 UTC
// Mentors and GSoC contributors can begin submitting midterm evaluations (for standard 12 week coding projects)
// July 18 - 18:00 UTC
// Midterm evaluation deadline (standard coding period)
// July 14 - August 25
// Work Period | GSoC contributors work on their project with guidance from Mentors
// August 25 - September 1 - 18:00 UTC
// Final week: GSoC contributors submit their final work product and their final mentor evaluation (standard coding period)


TODO

= Management of Coding Project

TODO

= Test Submissions

*EASY*: #link("https://github.com/criticic/r-testing-workflow-task/blob/master/.github/scripts/minify.sh")[Script to Minify R Package]
- Wrote a script that is agnostic to the package name and version, and can be used to minify any R package tarball. It also installs the minified package using `R CMD INSTALL`, to ensure that the package is installable.

*MEDIUM*: #link("https://github.com/criticic/r-testing-workflow-task/blob/master/.github/workflows/minify.yaml")[Github Action to Minify R Packages and Upload as Artifact]
- Created a GitHub Action that reads the package name and version from the issue description, checks if the package is already minified, and if not, minifies the package and uploads it as an artifact. The action also installs the minified package using `R CMD INSTALL`.
- It then comments on the issue with package size details, and time taken to minify the package.

*HARD*: #link("https://github.com/criticic/data.table-test-work-workflow/blob/master/.github/workflows")[Supporting PRs from Forks in Autocomment-atime-results]
- Modified the `Autocomment-atime-results` workflow to support PRs from forks. The workflow is divided into two parts: one that runs the tests and uploads the results as artifacts, and another that downloads the results and comments on the PR with the results. The workflow has been tested to work with PRs from forks and non-forks.
- Then cloned the data.table repository, with all its historical branches required for the atime results, and tested the workflow to work with PRs from forks and non-forks.