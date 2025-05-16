# Project Summary: Azure Log Automation Lab

## Problem Statement
Security and operations teams need an automated, consistent environment in Azure to collect logs and security data for analysis, alerting, and compliance.

## Project Definition
This Terraform project automates setup of:
- A secure NSG-bound subnet
- Public IP allocation
- A Linux VM for diagnostics
- A Log Analytics Workspace
- Diagnostic rules and endpoints

## Goals
- Enforce least privilege via NSG
- Automate log monitoring
- Showcase Terraform integration with Azure monitoring
- Prepare foundation for larger cloud SOC environments

## Results
Most infrastructure successfully deployed. Some Azure constraints around NSG/subnet bindings prevented full re-application without Terraform import. Future improvements will streamline import-handling.

## Recommendations
- Separate reusable Terraform modules
- Use pre-import validation logic
- Apply Azure Policy to enforce consistent tagging and NSG behavior
