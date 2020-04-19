# * demo-iac-2tier

## 1. IAM 계정 생성 및 AWS CLI 를 통한 로컬 환경 구성
* aws iam account 생성 (aws console)
AWS 관리 콘솔에서 프로그래밍 방식 로그인 계정 생성 및 AdministratorRole 부여

* awscli install  
```console
cmd $ brew install awscli
```

* AWS local 환경 설정 
```console

    cmd $ aws configure

    AWS Access Key ID [****************KCPQ]: 
    AWS Secret Access Key [****************OSRk]: 
    Default region name [ap-northeast-2]: 
    Default output format [None]: 
```
( AWS 설정 파일 저장 경로: ~/.aws/ )


## 2. terraform 설치 및 적용 

### 2.1 terraform 설치
* terraform install
```console
cmd $ brew install terraform
```

### 2.2. terraform 프로젝트 구성 (git clone)
* production 환경 기준
```console
cmd $ cd ~
cmd $ mkdir workspace
cmd $ cd workspace

/* git clone */
cmd $ git clone https://github.com/pe-woongjin/demo-iac-2tier.git
cmd $ cd ~/workspace/demo-iac-2tier/production
```

### 2.3 demo 프로젝트 구성 방법
    1 .tfstate 관리를 위해, S3 우선 구성
    ```console
    cmd $ cd ~/workspace/demo-iac-2tier/tf-repository/production
    cmd $ terraform init
    cmd $ terraform plan
    cmd $ terraform apply
    ```
    
    2 S3 구성이 완료되면, ~/workspace/demo-iac-2tier/production축 으로 돌아가 환경 구축
    ```console
    cmd $ cd ~/workspace/demo-iac-2tier/production
    cmd $ terraform init
    cmd $ terraform plan
    cmd $ terraform apply
    ``` 
    
    3 demo 인프라 구축이 완료되고, demo .tfstate가 기구축한 S3에 업로드되었는지 확인