package com.example.codepuzzle.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.example.codepuzzle.Entity.TUser;


@Repository
public interface RepoUser extends JpaRepository<TUser, String> {

   Optional<TUser> findByEmail(String email);

}