# Decision-Making-using-Influence-Diagrams

This project is part of [Probabilistic Graphical Models 1: Representation by Stanford University on Coursera](https://www.coursera.org/learn/probabilistic-graphical-models/home/welcome).

Refer to Assignment page - PA-Decision-Making

### Arrhythmogenic Right Ventricular Dysplasia(ARVD)
ARVD is a heart disease that is characterized by progressive replacement of cardiac muscle by
adipose (fat) cells and/or fibrosis (scar tissue), starting in the right ventricle. ARVD patients can
have potentially deadly arrhythmias (irregularities in the heart rate). There is a large heritable
component to the disease - up to half of cases are linked to a family history of the disease.
It is a progressive disease, and people with ARVD can remain asymptomatic for a long time
without suspecting that they have this condition. Currently, most patients with ARVD have
an implantable cardioverter defibrillator (ICD) surgically implanted. These devices are quite
effective in reducing arrhythmias.

However, ARVD can be difficult to diagnose with certainty. While having known genetic risk
factors confer susceptibility to developing ARVD, it is far from certain. Furthermore, diagnostic
tests that directly measure some characteristic of heart function are not perfect, with some
false positives and false negatives occurring. Different diagnostic tests also have different risks
- getting some electrodes put on your chest during a stress test has different risks than surgery.

In this exercise, we aim to model this decision making under uncertainity problem of surgically implanting ICD. 
To model this problem, we use influence diagrams. 

<figure>
  <img src="Images/IMG_0291.jpg" title="Influence Diagram of model for ICD surgical implanting decision process">
  <figcaption>Hello there</figcaption>
</figure>

Influence Diagrams comprises of three types of nodes - 
1. Random State Variables - These variables represent different conditions like presence or absence of a particular genetic risk factor etc. Conditional Probability Tables are used to specify their probability distribution. They are drawn using ovals. 
2. Decision Nodes - These variables represent the action taken in specific situations(for certain joint assignment of parents of decision node). It is represented by square. Example - The decision to surgically implant ICD or not.
3. Utility Nodes - These variables represent a utility value/reward for joint assignment of their parents. They are represented by diamond shaped box. Utility node measures the reward received by taking specific action in decision node and observing the states of random variables given random variables and decision nodes are parents of utility node. Example - 






