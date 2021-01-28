import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TasksAvailableComponent } from './tasks-available.component';

describe('TasksAvailableComponent', () => {
  let component: TasksAvailableComponent;
  let fixture: ComponentFixture<TasksAvailableComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TasksAvailableComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TasksAvailableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
