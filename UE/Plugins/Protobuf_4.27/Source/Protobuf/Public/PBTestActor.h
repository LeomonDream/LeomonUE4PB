// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Engine/Classes/GameFramework/Actor.h"
#include "PBTestActor.generated.h"

UCLASS()
class PROTOBUF_API APBTestActor : public AActor
{
	GENERATED_BODY()

public:
	// Sets default values for this actor's properties
	APBTestActor();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void Tick(float DeltaTime) override;
};
