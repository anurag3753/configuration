import yaml
from jira import JIRA
from collections import Counter

def collect_info(issue):
    issue_details = []
    issue_details.append(issue.permalink())
    issue_details.append(issue.fields.summary)
    issue_details.append(issue.fields.reporter.displayName)
    issue_details.append(issue.fields.status.name)
    # issue_details.append(issue.fields.description)
    return issue_details

def jira_issue_key(jira, query):
    issues = []
    issue_dict = dict()
    try:
        issues = jira.search_issues(query)
    except:
        print("Query: {} failed".format(query))
    if issues:
        for issue in issues:
            issue_dict[issue.key] = collect_info(issue)

    return issue_dict

def cr_reported_and_status_is_open(jira, user_list):
    issue_dict = {}
    for user in user_list:
        query = "project=CR and reporter={} and status!=closed".format(user)
        issue_dict.update(jira_issue_key(jira, query))
    return issue_dict

options = {"server": "http://jira.mycompany.com"}
jira = JIRA(options, basic_auth=("uid", "pwd"))
with open('team.yaml') as file:
    data = yaml.safe_load(file)
    print(data)
# This dictionary will be used in send_mail.py
d = cr_reported_and_status_is_open(jira, data['team_members'])
